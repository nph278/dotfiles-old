#!/usr/bin/env bash
# Installs dotfiles

mkdir -p ~/.config
rm -rf ~/.config/alacritty
rm -rf ~/.config/sway
rm -rf ~/.config/waybar
rm -rf ~/.config/htop
rm -rf ~/.config/bpytop
rm -rf ~/.config/nvim
rm -rf ~/.config/qutebrowser
rm -rf ~/.weechat
rm -f ~/.tmux.conf
cp -r config/alacritty ~/.config/alacritty
cp -r config/sway ~/.config/sway
cp -r config/waybar ~/.config/waybar
cp -r config/htop ~/.config/bpytop
cp -r config/bpytop ~/.config/bpytop
cp -r config/nvim ~/.config/nvim
cp -r config/qutebrowser ~/.config/qutebrowser
cp -r config/weechat ~/.weechat
cp config/.tmux.conf ~/.tmux.conf
cp config/.zshrc ~/.zshrc
