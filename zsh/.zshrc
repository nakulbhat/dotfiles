# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
# End of lines configured by zsh-newuser-install
EDITOR=nvim

bindkey '^ ' autosuggest-execute
eval "$(oh-my-posh --config '~/.zsh_theme.omp.json' init zsh)"

eval "$(zoxide init zsh)"
alias n='nvim'
alias cd='z'
rm() {
  local args=()
  for arg in "$@"; do
    case "$arg" in
      -r|-f|-rf|-fr)
        echo "note: ignoring rm flag '$arg'"
        ;;
      *) args+=("$arg") ;;
    esac
  done
  rip "${args[@]}"
}
export TEXINPUTS=/home/nakul/gitclones/LatexClassFiles//:

aw() {
  # strip .tex if given
  base="${1%.tex}"

  pdf="${base}.pdf"

  if [ -f "$pdf" ]; then
    zathura "$pdf" &
  else
    arara "$base" || return
    zathura "$pdf" &
  fi

  fd | entr -c arara "$base" -v
}

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export SHELL=/usr/bin/zsh 
export LC_ALL=en_US.UTF-8

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
