#!/usr/bin/env zsh

# Get all zoxide directories, sort them by path length, and add ~ as the first option
dirs=$(zoxide query --list | awk '{ print length, $0 }' | sort -n | cut -d' ' -f2-)
dirs_with_home=$(printf "%s\n%s" "$HOME" "$dirs")

# Let user select a directory with tofi
selected_dir=$(echo "$dirs_with_home" | tofi --prompt="open terminal: ")

# If user exited without selecting anything, do nothing
[ -z "$selected_dir" ] && exit 0

# Open kitty in the selected directory (if valid)
if [ -d "$selected_dir" ]; then
    kitty --directory "$selected_dir"
else
    notify-send -t 2000 "Tofi" "Directory not found: $selected_dir"
fi
