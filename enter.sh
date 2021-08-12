passwd carl
git clone https://github.com/zsh-users/zsh-autosuggestions.git /home/carl/.zsh/zsh-autosuggestions --depth=1
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/carl/.zsh/zsh-syntax-highlighting --depth=1
curl -fLo /home/carl/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd /home/carl/Projects/dotfiles
stow alacritty sway zsh nvim dash
