#!/bin/bash

# Simple approach to get keyboard layout
hyprctl devices | grep -A 20 "at-translated-set-2-keyboard" | grep "active_keymap" | awk '{print $2}' | head -c 2 | tr '[:lower:]' '[:upper:]'
