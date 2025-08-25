#!/usr/bin/env zsh

# Run tofi-run and store the output in appName
appName=$(tofi-run)

# Check if appName is empty
if [ -z "$appName" ]; then
    # If it's empty, send a notification and exit
    notify-send -t 2000 "Tofi" "No application selected or tofi was aborted."
    exit 1
fi

# If appName is not empty, execute the application
hyprctl keyword exec "$appName"
