cp .zshrc ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions --depth=1
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting --depth=1
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
rm -rf ~/.config/alacritty
rm -rf ~/.config/sway
rm -rf ~/.config/waybar
rm -rf ~/.config/htop
rm -rf ~/.config/bpytop
rm -rf ~/.config/nvim
rm -rf ~/.weechat
rm ~/.tmux.conf
cp -r .config/alacritty ~/.config/alacritty
cp -r .config/sway ~/.config/sway
cp -r .config/waybar ~/.config/waybar
cp -r .config/htop ~/.config/bpytop
cp -r .config/bpytop ~/.config/bpytop
cp -r .config/nvim ~/.config/nvim
cp -r .weechat ~/.weechat
cp .tmux.conf ~/.tmux.conf
