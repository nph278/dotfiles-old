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
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

alias ls="ls --color"
alias l="ls -la"
alias vim="nvim"
alias ga="git add -A"
alias gc="git commit -m"
alias gp="git push origin"
alias gg="git log --graph --pretty=oneline --abbrev-commit"
alias gl="git log --graph --pretty=short"
alias gac="git add -A && git commit -m"
alias gf="git fetch"
alias db="gdb -tui"
alias rm="trash"
alias kee="keepassxc-cli open ~/KeePass.kdbx"

clean() {
  while pkgs=$(paru -Qtd) do
    paru -R $(paru -Qtd | awk '{print $1}' | tr '\n' ' ')
  done
}

up() {
  paru -Syu
}

add() {
  paru -S $1
}

del() {
  paru -R $1
}

setopt AUTO_CD
setopt PROMPT_SUBST

bindkey -v

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ $TERM == 'alacritty' ]] &&
  [[ -f /usr/bin/pfetch ]]; then
  pfetch
fi

