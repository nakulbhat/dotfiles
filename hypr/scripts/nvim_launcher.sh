#!/usr/bin/env zsh

# Find directories and let the user select one with tofi
selected_dir=$(zoxide query --list | grep gitclones | awk '{ print length, $0 }' | sort -n | cut -d' ' -f2-  | tofi --prompt="nvim open: ")

# Check if a directory was selected
if [ -z "$selected_dir" ]; then
    # If not, send a notification and exit
    notify-send -t 2000 "Tofi" "No directory selected or tofi was aborted."
    exit 1
fi

# Change to the selected directory
cd "$selected_dir" || {
    notify-send -t 2000 "Tofi" "Failed to change to directory: $selected_dir"
    exit 1
}

# Open nvim in kitty in the selected directory
kitty nvim
