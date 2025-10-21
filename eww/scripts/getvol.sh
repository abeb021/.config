#!/bin/bash

# Get volume using pactl
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | sed 's/%//')
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -oP 'yes|no')

if [ "$mute" = "yes" ]; then
    /usr/bin/eww update volico="󰖁"
    vol="0";
else
    /usr/bin/eww update volico="󰕾"
fi
/usr/bin/eww update get_vol="$vol"

# Listen for volume changes
pactl subscribe | stdbuf -oL grep --line-buffered "Event 'change' on sink" | while read -r _; do
    vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | sed 's/%//')
    mute=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -oP 'yes|no')
    if [ "$mute" = "yes" ]; then
        /usr/bin/eww update volico="󰖁"
        vol="0";
    else
        /usr/bin/eww update volico="󰕾"
    fi
    /usr/bin/eww update get_vol="$vol"
done
