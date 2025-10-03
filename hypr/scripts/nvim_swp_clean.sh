#!/usr/bin/env zsh

# Directory where Neovim stores its state files
NVIM_STATE_DIR="$HOME/.local/state/nvim"

echo "Attempting to clean up Neovim swap files..."

# Find all .swp files recursively and safely pipe them to the deletion command.
find "$NVIM_STATE_DIR" -type f -name "*.swp" -print0 | xargs rm -f

# If the previous command (find | xargs) exited successfully (0)...
if [ $? -eq 0 ]; then
    # ...and if 'notify-send' is available, send the success notification.
    if command -v notify-send &> /dev/null; then
        notify-send -a "Neovim Cleanup" "Success" "Swap files cleaned up!"
    else
        echo "Cleanup successful, but notify-send is not installed."
    fi
else
    # Simple feedback for the console if the operation failed.
    echo "Cleanup failed. Check if '$DELETE_CMD' is installed or if the path is correct."
fi
