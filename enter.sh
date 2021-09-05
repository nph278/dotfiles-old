passwd
#git clone https://github.com/zsh-users/zsh-autosuggestions.git /home/carl/.zsh/zsh-autosuggestions --depth=1
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/carl/.zsh/zsh-syntax-highlighting --depth=1
#curl -fLo /home/carl/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    #https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
wget 192.168.1.243:2015/KeePass.kdbx
curl 192.168.1.243:2015/id_ed25519 > .ssh/id_ed25519
curl 192.168.1.243:2015/id_ed25519.pub > .ssh/id_ed25519.pub
GITHUB_PASSWORD="$(keepassxc-cli show KeePass.kdbx Passwords/GitHub --show-protected | grep Password | awk '{print $2}')"
cd Projects/dotfiles
stow alacritty sway zsh nvim dash
