#!/bin/bash

DEVICE_MAC="08:E4:DF:CA:4A:FC"
DEVICE_NAME="TECNO Buds 4 Air"

info=$(bluetoothctl info "$DEVICE_MAC" 2>/dev/null)
if echo "$info" | grep -q "Connected: yes"; then
    echo "Headphones $DEVICE_NAME ($DEVICE_MAC) are connected. Disconnecting..."
    bluetoothctl disconnect "$DEVICE_MAC"
    notify-send -t 4000 -a "Bluetooth" "Headphones Disconnected" "Disconnected from $DEVICE_NAME." -i audio-headphones
else
    echo "Headphones $DEVICE_NAME ($DEVICE_MAC) are not connected. Connecting..."
    
    if bluetoothctl connect "$DEVICE_MAC"; then
        notify-send -t 2500 -a "Bluetooth" "Headphones Connected" "Connected to $DEVICE_NAME." -i audio-headphones
    else
        notify-send -t 2500 -a "Bluetooth Error" "Connection Failed" "Failed to connect to $DEVICE_NAME. Please ensure headphones are on and in pairing mode." -i dialog-error
    fi
fi
