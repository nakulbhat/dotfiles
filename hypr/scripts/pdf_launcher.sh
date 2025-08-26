#!/usr/bin/env zsh

# Use a glob to find PDFs in both directories and pipe to a loop
# The 'D' flag includes dotfiles, 'N' means no match is an empty list
# The '(.)' part ensures we are only globbing regular files
search_results=$(
    for f in gitclones/**/*.pdf(DN.) ~/Downloads/**/*.pdf(DN.); do
        # If the file is in gitclones, strip the prefix
        if [[ "$f" == gitclones/* ]]; then
            echo "${f#gitclones/}"
        else
            # Otherwise, just print the path (you can customize this)
            echo "$f"
        fi
    done
)

selected_pdf=$(echo "$search_results" | tofi --prompt="zathura open: ")

# Check if a PDF file was selected
if [ -z "$selected_pdf" ]; then
    notify-send -t 2000 "Tofi" "No PDF selected or tofi was aborted."
    exit 1
fi

# Re-add the gitclones prefix if needed, or leave the path as-is
if [[ ! -f "$selected_pdf" ]]; then
    zathura "gitclones/$selected_pdf"
else
    zathura "$selected_pdf"
fi
