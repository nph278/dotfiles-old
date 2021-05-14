curl -sLf https://spacevim.org/install.sh | bash
cp .zshrc ~/.zshrc
cp -r .config/wallpaper ~/.config/wallpaper
cp -r .config/alacritty ~/.config/alacritty
cp -r .config/sway ~/.config/sway
rm -rf .SpaceVim.d
cp -r .SpaceVim.d ~/.SpaceVim.d
