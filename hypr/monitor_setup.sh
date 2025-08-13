#!/usr/bin/env bash

# Get the list of all monitors (in JSON format) and count them
MONITOR_COUNT=$(hyprctl monitors -j | jq 'length')

# Check if the monitor count is exactly 2
if [ "$MONITOR_COUNT" -eq 2 ]; then
    echo "Two monitors detected. Proceeding with configuration..."
    
    # 1. Turn off the external monitor ("HDMI-A-1")
    hyprctl keyword monitor "HDMI-A-1, disable"
    # 2. Turn off the laptop monitor ("eDP-1")
    hyprctl keyword monitor "eDP-1, disable"

    # 3. Turn on the external monitor with resolution 1366x768
    sleep 1
    hyprctl keyword monitor "HDMI-A-1, 1366x768@60, 0x0, 1"
    sleep 1
    # 4. Turn on the internal monitor with resolution 1920x1080
    hyprctl keyword monitor "eDP-1, 1920x1080@60, 1366x0, 1"

else
    echo "Either more or less than two monitors are attached. Exiting script."
fi
