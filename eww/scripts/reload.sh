#!/bin/bash

# Kill EWW completely
eww kill

# Wait for complete cleanup
sleep 1

# Start EWW daemon
eww daemon

# Wait for daemon to initialize
sleep 0.5

# Open the bar widget
eww open bar_widget

# Restart other services
killall hyprpaper && hyprpaper
killall hyprsunset && hyprsunset

