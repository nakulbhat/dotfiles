# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nakul/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
EDITOR=nvim

bindkey '^ ' autosuggest-execute
eval "$(oh-my-posh --config '~/.zsh_theme.omp.json' init zsh)"

eval "$(zoxide init zsh)"
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'
alias gs='git status'
alias n='nvim'
alias cd='z'
