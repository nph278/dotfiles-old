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

alias ls="ls -G"
alias l="ls -laG"
alias c="code ."
alias vim="nvim"
alias ga="git add -A"
alias gc="git commit -m"
alias gp="git push origin"

setopt AUTO_CD
setopt PROMPT_SUBST

bindkey -v

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
