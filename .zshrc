# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PROMPT="%F{white}%(?..[%F{red}%?%F{white}])[%F{yellow}%+%F{white}] %F{green}%n@%m%F{white} %F{ref}%~%F{white} "

alias ls="ls --color"
alias l="ls -la --color"

setopt AUTO_CD

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highighting/zsh-syntax-highighting.zsh
