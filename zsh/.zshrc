# https://www.youtube.com/watch?v=-ErlODxiIrM

# ███████╗███████╗██╗  ██╗
# ╚══███╔╝██╔════╝██║  ██║
#   ███╔╝ ███████╗███████║
#  ███╔╝  ╚════██║██╔══██║
# ███████╗███████║██║  ██║
# ╚══════╝╚══════╝╚═╝  ╚═╝

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Don't Ask
bindkey -e
zstyle :compinstall filename '~/.zshrc'

# Path
export PATH="$PATH:/home/carl/.cargo/bin"

# Don't Ask
autoload -Uz compinit
compinit

# Prompt
PROMPT='%F{white}%(?..%F{red}%?%F{white} )%F{yellow}%*%F{white} %F{green}%n@%m%F{white} %F{red}%~%F{white}$([[ -d ./.git ]] && printf ":")%F{magenta}$([[ -d ./.git ]] && git branch --show-current)%F{white} '

# Vi Mode Cursur
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


## Aliases

# LS
alias ls="ls --color"
alias l="ls -la"

# Git
alias ga="git add -A"
alias gc="git commit -m"
alias gp="git push origin"
alias gg="git log --graph --pretty=oneline --abbrev-commit"
alias gl="git log --graph --pretty=short"
alias gac="git add -A && git commit -m"
alias gf="git fetch"

# Programs
alias kee="fl org.keepassxc.KeePassXC"
alias blender="fl org.blender.Blender"
alias steam="fl com.valvesoftware.Steam"
alias stk="fl net.supertuxkart.SuperTuxKart"

# Other
alias db="gdb -tui"
alias rm="trash"
alias dev="toolbox run -c dev zsh"

# Functions

fl() {
  flatpak run $1 > /dev/null & disown
}

update() {
  sudo rpm-ostree update
  flatpak update
}

setup-dev() {
  toolbox create dev
  toolbox run -c dev "sudo dnf install neovim rust rust-src cargo rustfmt trash-cli"
}

up-shutdown() {
  update && sudo shutdown now
}

# Options

setopt AUTO_CD
setopt PROMPT_SUBST

# Vi Mode

bindkey -v

# Plugins

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# PFetch on startup

if [[ $TERM == 'alacritty' ]]; then
  ~/.local/bin/pfetch | lolcat -h 1
fi

