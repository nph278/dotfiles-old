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

PROMPT='%F{white}%(?..%F{red}%?%F{white} )%F{yellow}%*%F{white} %F{green}%n@%m%F{white} %F{red}%~%F{white}$([[ -d ./.git ]] && printf ":")%F{magenta}$([[ -d ./.git ]] && git branch --show-current)%F{white} '

alias ls="ls -G"
alias l="ls -laG"
alias c="code ."
alias vim="nvim"

setopt AUTO_CD
setopt PROMPT_SUBST

bindkey -v

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
