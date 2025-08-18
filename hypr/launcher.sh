appName=$(echo "
firefox
codium
youtube-music" | tofi --require-match=false)
hyprctl  keyword exec $appName
