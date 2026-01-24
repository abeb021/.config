#!/bin/bash

# Theme Switcher Script
# Changes themes for: waybar, wofi, kitty, hyprland, hyprlock, hyprpaper

CONFIG_DIR="$HOME/.config"
THEME_CATEGORY="dark"  # or "white" for light themes
THEME_NAME="${1:-deepblue}"

# Discover available themes from waybar styles directory
get_available_themes() {
    local themes_dir="$CONFIG_DIR/waybar/styles/$THEME_CATEGORY"
    if [ -d "$themes_dir" ]; then
        find "$themes_dir" -maxdepth 1 -type f -name "*.css" -exec basename {} .css \;
    fi
}

# Get available themes
THEMES=($(get_available_themes | sort))

# Validate theme name
if [[ ! " ${THEMES[@]} " =~ " ${THEME_NAME} " ]]; then
    echo "Invalid theme: $THEME_NAME"
    echo "Available themes: ${THEMES[*]}"
    exit 1
fi

# Function to update waybar theme
update_waybar() {
    local waybar_style="$CONFIG_DIR/waybar/style.css"
    if [ -f "$waybar_style" ]; then
        sed -i "s|@import \"styles/[^/]*/[^\"]*\.css\";|@import \"styles/$THEME_CATEGORY/$THEME_NAME.css\";|" "$waybar_style"
        echo "✓ Updated waybar theme to $THEME_NAME"
    fi
}

# Function to update wofi theme
update_wofi() {
    local wofi_style="$CONFIG_DIR/wofi/style.css"
    if [ -f "$wofi_style" ]; then
        sed -i "s|@import \".config/wofi/styles/[^/]*/[^\"]*\.css\";|@import \".config/wofi/styles/$THEME_CATEGORY/$THEME_NAME.css\";|" "$wofi_style"
        echo "✓ Updated wofi theme to $THEME_NAME"
    fi
}

# Function to update kitty theme
update_kitty() {
    local kitty_conf="$CONFIG_DIR/kitty/kitty.conf"
    if [ -f "$kitty_conf" ]; then
        sed -i "s|include themes/[^/]*/[^\"]*\.conf|include themes/$THEME_CATEGORY/$THEME_NAME.conf|" "$kitty_conf"
        echo "✓ Updated kitty theme to $THEME_NAME"
    fi
}

# Function to update hyprland theme
update_hyprland() {
    local hyprland_conf="$CONFIG_DIR/hypr/hyprland.conf"
    if [ -f "$hyprland_conf" ]; then
        sed -i "s|source = ~/.config/hypr/hyprland/themes/[^/]*/[^\"]*\.conf|source = ~/.config/hypr/hyprland/themes/$THEME_CATEGORY/$THEME_NAME.conf|" "$hyprland_conf"
        echo "✓ Updated hyprland theme to $THEME_NAME"
    fi
}

# Function to update hyprlock theme
update_hyprlock() {
    local hyprlock_conf="$CONFIG_DIR/hypr/hyprlock.conf"
    if [ -f "$hyprlock_conf" ]; then
        sed -i "s|source = \$HOME/.config/hypr/hyprlockThemes/[^/]*/[^\"]*\.conf|source = \$HOME/.config/hypr/hyprlockThemes/$THEME_CATEGORY/$THEME_NAME.conf|" "$hyprlock_conf"
        echo "✓ Updated hyprlock theme to $THEME_NAME"
    fi
}

# Function to update hyprpaper wallpaper
update_hyprpaper() {
    local hyprpaper_conf="$CONFIG_DIR/hypr/hyprpaper.conf"
    local wallpaper_dir="$CONFIG_DIR/hypr/assets/wallpapers"
    local wallpaper_path_full=""
    local wallpaper_path_tilde=""
    local wallpaper_ext=""
    
    if [ -f "$hyprpaper_conf" ]; then
        # Check for wallpaper with common image extensions
        for ext in jpg png jpeg webp bmp gif tiff tif; do
            local test_path="$wallpaper_dir/$THEME_NAME.$ext"
            if [ -f "$test_path" ]; then
                wallpaper_path_full="$test_path"
                wallpaper_ext="$ext"
                break
            fi
        done
        
        # If still not found, try to find any file with the theme name (case-insensitive)
        if [ -z "$wallpaper_path_full" ]; then
            local found_file=$(find "$wallpaper_dir" -maxdepth 1 -iname "$THEME_NAME.*" -type f | head -n 1)
            if [ -n "$found_file" ]; then
                wallpaper_path_full="$found_file"
                wallpaper_ext="${found_file##*.}"
            fi
        fi
        
        # If no wallpaper found, warn and return
        if [ -z "$wallpaper_path_full" ]; then
            echo "⚠ Warning: Wallpaper not found for theme: $THEME_NAME"
            return
        fi
        
        # Convert to tilde format
        wallpaper_path_tilde="~/.config/hypr/assets/wallpapers/$THEME_NAME.$wallpaper_ext"
        
        # Backup original file
        cp "$hyprpaper_conf" "${hyprpaper_conf}.bak"
        
        # Update preload line (simple sed)
        sed -i "s|^preload = .*|preload = $wallpaper_path_tilde|" "$hyprpaper_conf"
        
        # Update wallpaper block using sed with range address
        # sed pattern: /^wallpaper *{/,/^}/ finds the wallpaper block
        # Within that block, update the path line
        sed -i "/^wallpaper *{/,/^}/{
            s|^[[:space:]]*path[[:space:]]*=.*|    path = $wallpaper_path_tilde|
        }" "$hyprpaper_conf"
        
        # If there are multiple monitor lines, update them to maintain consistency
        # This keeps the existing monitor name but updates the path
        sed -i "/^wallpaper *{/,/^}/{
            /^[[:space:]]*monitor[[:space:]]*=/!b
            s|^\([[:space:]]*monitor[[:space:]]*=[[:space:]]*\).*|\1eDP-1|
        }" "$hyprpaper_conf"
        
        echo "✓ Updated hyprpaper wallpaper to $THEME_NAME ($wallpaper_ext)"
        
        # Reload hyprpaper
        killall hyprpaper 2>/dev/null
        hyprpaper --config "$hyprpaper_conf" &
    fi
}

# Main execution
main() {
    echo "Switching theme to: $THEME_NAME"
    echo "-----------------------------------"
    
    update_waybar
    update_wofi
    update_kitty
    update_hyprland
    update_hyprlock
    update_hyprpaper
    
    echo "-----------------------------------"
    echo "Theme switch complete!"
    echo ""
    echo "Note: You may need to restart applications for changes to take effect:"
    echo "  - waybar: killall waybar && waybar &"
    echo "  - kitty: restart terminal or open new window"
    echo "  - hyprland: hyprctl reload"
}

# Run main function
main

