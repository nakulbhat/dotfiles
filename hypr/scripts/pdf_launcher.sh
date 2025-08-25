#!/usr/bin/env zsh

# Find all PDF files, prune .git directories, and let the user select one with tofi
selected_pdf=$(find gitclones/ -path '*/.git*' -prune -o -type f -iname '*.pdf' -print | tofi)

# Check if a PDF file was selected
if [ -z "$selected_pdf" ]; then
    # If not, send a notification and exit
    notify-send -t 2000 "Tofi" "No PDF selected or tofi was aborted."
    exit 1
fi

# Open the selected PDF with zathura
zathura "$selected_pdf"
