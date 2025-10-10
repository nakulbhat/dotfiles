#!/usr/bin/env bash

# Directory where Neovim stores its state files
NVIM_STATE_DIR="$HOME/.local/state/nvim"

# Clean up swap files
if find "$NVIM_STATE_DIR" -type f -name "*.swp" -exec rm -f {} +; then
    if command -v notify-send &>/dev/null; then
        notify-send -a "Neovim Cleanup" "Swap files cleaned" "All .swp files removed successfully."
    else
        echo "Neovim swap files cleaned (notify-send not available)."
    fi
else
    echo "Failed to clean Neovim swap files."
fi
