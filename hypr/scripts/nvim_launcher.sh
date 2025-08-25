!# /usr/bin/env zsh
cd $(find ~/gitclones/ -mindepth 1 -maxdepth 1 -type d | tofi)
kitty nvim
