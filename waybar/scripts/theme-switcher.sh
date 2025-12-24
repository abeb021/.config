#!/bin/bash

# Theme Switcher Script
# Changes themes for: waybar, wofi, kitty, hyprland, hyprlock

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

# Main execution
main() {
    echo "Switching theme to: $THEME_NAME"
    echo "-----------------------------------"
    
    update_waybar
    update_wofi
    update_kitty
    update_hyprland
    update_hyprlock
    
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

