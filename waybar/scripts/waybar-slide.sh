#!/bin/bash

THRESHOLD=10
WAYBAR_VISIBLE=true

while true; do
    Y=$(hyprctl cursorpos | awk '{print $2}' | tr -d ',')
    
    if [[ "$Y" -le "$THRESHOLD" && "$WAYBAR_VISIBLE" = false ]]; then
        hyprctl dispatch exec /usr/bin/waybar
        WAYBAR_VISIBLE=true
    elif [[ "$Y" -gt "$THRESHOLD" && "$WAYBAR_VISIBLE" = true ]]; then
        killall waybar 2>/dev/null
        WAYBAR_VISIBLE=false
    fi
    
    sleep 0.1
done
