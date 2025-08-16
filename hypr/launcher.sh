appName=$(echo "
firefox
codium
youtube-music" | tofi)
hyprctl  keyword exec $appName