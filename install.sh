curl -sLf https://spacevim.org/install.sh | bash
cp .zshrc ~/.zshrc
cp -r .config/wallpaper ~/.config/wallpaper
cp -r .config/alacritty ~/.config/alacritty
cp -r .config/sway ~/.config/sway
cp -r .config/waybar ~/.config/waybar
rm -rf .SpaceVim.d
cp -r .SpaceVim.d ~/.SpaceVim.d
