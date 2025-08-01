#!/bin/bash

# Get WiFi interface
WIFI_INTERFACE="wlan0"

# Get WiFi connection info using iwconfig
WIFI_INFO=$(iwconfig $WIFI_INTERFACE 2>/dev/null)

if [ -z "$WIFI_INFO" ]; then
    echo '{"text": "󰤭", "tooltip": "WiFi interface not found"}'
    exit 0
fi

# Check if connected
if echo "$WIFI_INFO" | grep -q "ESSID:off/any"; then
    echo '{"text": "󰤭", "tooltip": "WiFi disconnected"}'
    exit 0
fi

# Extract SSID and link quality
SSID=$(echo "$WIFI_INFO" | grep "ESSID:" | sed 's/.*ESSID:"\([^"]*\)".*/\1/')
LINK_QUALITY=$(echo "$WIFI_INFO" | grep "Link Quality" | sed 's/.*Link Quality=\([0-9]*\)\/[0-9]*.*/\1/')
MAX_QUALITY=$(echo "$WIFI_INFO" | grep "Link Quality" | sed 's/.*Link Quality=[0-9]*\/\([0-9]*\).*/\1/')

if [ -z "$SSID" ] || [ -z "$LINK_QUALITY" ] || [ -z "$MAX_QUALITY" ]; then
    echo '{"text": "󰤭", "tooltip": "No WiFi connection"}'
    exit 0
fi

# Calculate signal percentage using bash arithmetic
SIGNAL_PERCENT=$((LINK_QUALITY * 100 / MAX_QUALITY))

# Ensure percentage is within bounds
if [ "$SIGNAL_PERCENT" -lt 0 ]; then
    SIGNAL_PERCENT=0
elif [ "$SIGNAL_PERCENT" -gt 100 ]; then
    SIGNAL_PERCENT=100
fi

# Choose icon based on signal strength
if [ "$SIGNAL_PERCENT" -ge 80 ]; then
    ICON="󰤨"
elif [ "$SIGNAL_PERCENT" -ge 60 ]; then
    ICON="󰤥"
elif [ "$SIGNAL_PERCENT" -ge 40 ]; then
    ICON="󰤢"
elif [ "$SIGNAL_PERCENT" -ge 20 ]; then
    ICON="󰤟"
else
    ICON="󰤯"
fi

echo "{\"text\": \"$ICON $SSID\", \"tooltip\": \"$SSID ($SIGNAL_PERCENT%)\"}" 