# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nakul/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
EDITOR=nvim

bindkey '^ ' autosuggest-execute
eval "$(oh-my-posh init zsh)"
