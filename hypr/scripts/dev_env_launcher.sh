#!/usr/bin/env zsh

# Find dev.sh files under ~/gitclones and select one with tofi
selected_script=$(
  fd -t f dev.sh ~/gitclones \
  | tofi --prompt="run dev.sh: "
)

# Check if a script was selected
if [[ -z "$selected_script" ]]; then
  notify-send -t 2000 "Tofi" "No script selected or tofi was aborted."
  exit 1
fi

# Ensure the script is executable
if [[ ! -x "$selected_script" ]]; then
  notify-send -t 2000 "Tofi" "Script is not executable: $selected_script"
  exit 1
fi

# Run the selected dev.sh in kitty
kitty zsh -c "cd \"$(dirname "$selected_script")\" && ./$(basename "$selected_script")"
