curl -sLf https://spacevim.org/install.sh | bash
cp .zshrc ~/.zshrc
cp -r .config/alacritty ~/.config/alacritty
cp -r .config/sway ~/.config/sway
cp -r .config/waybar ~/.config/waybar
cp -r .config/htop ~/.config/bpytop
cp -r .config/bpytop ~/.config/bpytop
cp -r .weechat ~/.weechat
rm -rf ~/.SpaceVim.d
cp -r .SpaceVim.d ~/.SpaceVim.d
