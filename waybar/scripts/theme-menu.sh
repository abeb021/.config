#!/bin/bash

# Theme Selection Menu Script
# Shows a wofi menu to select themes

CONFIG_DIR="$HOME/.config"
THEME_CATEGORY="dark"

# Discover available themes from waybar styles directory
get_available_themes() {
    local themes_dir="$CONFIG_DIR/waybar/styles/$THEME_CATEGORY"
    if [ -d "$themes_dir" ]; then
        find "$themes_dir" -maxdepth 1 -type f -name "*.css" -exec basename {} .css \; | sort
    fi
}

# Format theme name for display (e.g., "deepblue" -> "Deep Blue", "fierysunset" -> "Fiery Sunset")
format_theme_name() {
    local theme="$1"
    
    # Handle known compound words
    case "$theme" in
        deepblue) echo "Deep Blue" ;;
        fierysunset) echo "Fiery Sunset" ;;
        goldenamber) echo "Golden Amber" ;;
        rosepink) echo "Rose Pink" ;;
        *)
            # For unknown themes: capitalize first letter and add space before capitals
            echo "$theme" | sed 's/^\(.\)/\U\1/' | sed 's/\([a-z]\)\([A-Z]\)/\1 \2/g'
            ;;
    esac
}

# Get current theme from waybar style.css
get_current_theme() {
    local waybar_style="$CONFIG_DIR/waybar/style.css"
    if [ -f "$waybar_style" ]; then
        grep -oP '@import "styles/[^/]*/\K[^"]*' "$waybar_style" | sed 's/\.css$//'
    fi
}

# Show theme selection menu
show_menu() {
    local current_theme=$(get_current_theme)
    local menu_items=()
    local theme_keys=()
    
    # Get available themes and build menu items
    while IFS= read -r theme_key; do
        if [ -n "$theme_key" ]; then
            local theme_display=$(format_theme_name "$theme_key")
            theme_keys+=("$theme_key")
            if [ "$theme_key" = "$current_theme" ]; then
                menu_items+=("[Current] $theme_display")
            else
                menu_items+=("$theme_display")
            fi
        fi
    done < <(get_available_themes)
    
    # Show menu using wofi (printf each item on a new line, no trailing newline)
    local selected=$(printf '%s\n' "${menu_items[@]}" | wofi --dmenu --prompt "Select Theme" --width 300 --height 400)
    
    if [ -z "$selected" ]; then
        exit 0
    fi
    
    # Remove [Current] prefix if present
    selected=$(echo "$selected" | sed 's/\[Current\] //')
    
    # Find theme key from display name
    local selected_theme=""
    local i=0
    for theme_display in "${menu_items[@]}"; do
        # Remove [Current] prefix for comparison
        local display_clean=$(echo "$theme_display" | sed 's/\[Current\] //')
        if [ "$display_clean" = "$selected" ]; then
            selected_theme="${theme_keys[$i]}"
            break
        fi
        ((i++))
    done
    
    if [ -n "$selected_theme" ]; then
        # Run theme switcher
        "$CONFIG_DIR/waybar/scripts/theme-switcher.sh" "$selected_theme"
        
        # Reload waybar
        killall waybar 2>/dev/null
        waybar &
        
        # Reload hyprland
        hyprctl reload 2>/dev/null
        
        # Send notification
        local display_name=$(format_theme_name "$selected_theme")
        notify-send "Theme Changed" "Switched to $display_name" -t 2000
    fi
}

show_menu

