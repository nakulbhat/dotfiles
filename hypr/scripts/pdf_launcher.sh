#!/usr/bin/env zsh
set -euo pipefail

GIT_DIR="gitclones"
DOWN_DIR="$HOME/Downloads"

# Find PDFs (include hidden, ignore .gitignore, but skip .git folders)
search_results=$(
  fd -t f -e pdf -I --hidden --exclude '.git' . "$GIT_DIR" "$DOWN_DIR" |
  awk -v G="$GIT_DIR/" -v D="$DOWN_DIR/" '
    index($0, G) == 1 { print "GIT/" substr($0, length(G)+1) ; next }
    index($0, D) == 1 { print "Downloads/" substr($0, length(D)+1) ; next }
    { print }
  '
)

selected_pdf=$(printf '%s\n' "$search_results" | tofi --prompt="zathura open: ")

# If no file chosen
if [[ -z "$selected_pdf" ]]; then
  notify-send -t 2000 "Tofi" "No PDF selected or tofi was aborted."
  exit 1
fi

# Map display name back to full path
case "$selected_pdf" in
  GIT/*) full_path="${GIT_DIR}/${selected_pdf#GIT/}" ;;
  Downloads/*) full_path="${DOWN_DIR}/${selected_pdf#Downloads/}" ;;
  *) full_path="$selected_pdf" ;;
esac

if [[ -f "$full_path" ]]; then
  zathura "$full_path"
else
  notify-send -t 2000 "Zathura" "File not found: $selected_pdf"
  exit 1
fi
