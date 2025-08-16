#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Get the absolute path to the directory where the script is located.
# This makes the script portable, regardless of where it's executed from.
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Define the destination directories
HYPR_DEST="$HOME/.config/hypr"
NVIM_DEST="$HOME/.config/nvim"
NIXOS_DEST="/etc/nixos"

# --- Remove existing folders ---
# Use a series of checks to ensure we don't accidentally remove a non-symlink
if [[ -L "$HYPR_DEST" ]]; then
    echo "Removing existing symlink at $HYPR_DEST"
    rm -f "$HYPR_DEST"
elif [[ -d "$HYPR_DEST" ]]; then
    echo "Warning: $HYPR_DEST is a directory, not a symlink. Skipping removal."
fi

if [[ -L "$NVIM_DEST" ]]; then
    echo "Removing existing symlink at $NVIM_DEST"
    rm -f "$NVIM_DEST"
elif [[ -d "$NVIM_DEST" ]]; then
    echo "Warning: $NVIM_DEST is a directory, not a symlink. Skipping removal."
fi

if [[ -L "$NIXOS_DEST" ]]; then
    echo "Removing existing symlink at $NIXOS_DEST"
    sudo rm -f "$NIXOS_DEST"
elif [[ -d "$NIXOS_DEST" ]]; then
    echo "Warning: $NIXOS_DEST is a directory, not a symlink. Skipping removal."
fi

# --- Create new symbolic links ---
echo "Creating new symlinks..."
ln -s "$DOTFILES_DIR/hypr" "$HYPR_DEST"
ln -s "$DOTFILES_DIR/nvim" "$NVIM_DEST"
sudo ln -s "$DOTFILES_DIR/nixos" "$NIXOS_DEST"

echo "Deployment complete!"


# add stuff for other apps, add chmods for hypr scripts 