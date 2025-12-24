#!/bin/bash

# Get current theme name and format it for display

CONFIG_DIR="$HOME/.config"
waybar_style="$CONFIG_DIR/waybar/style.css"

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

if [ -f "$waybar_style" ]; then
    # Extract theme name from waybar style.css
    theme=$(grep -oP '@import "styles/[^/]*/\K[^"]*' "$waybar_style" | sed 's/\.css$//')
    
    # Format theme name for display
    format_theme_name "$theme"
else
    echo "Unknown"
fi

