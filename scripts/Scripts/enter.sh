cd /root
passwd

# User
useradd -mg wheel carl
echo "permit :wheel" > /etc/doas.conf
echo "permit root" > /etc/doas.conf
pacman -R sudo
sed -i 's/PACMAN_AUTH=()/PACMAN_AUTH=(doas)/' /etc/makepkg.conf
chsh carl -s /bin/dash
rm /bin/sh
ln -s /bin/dash /bin/sh
passwd carl

# tldr
doas -u carl tldr --update

# Paru
cd /home/carl
git clone https://aur.archlinux.org/paru-bin.git --depth=1
cd paru-bin
chown carl .
doas -u carl makepkg -si
cd ..
rm -rf paru-bin

cd /root

sed -i 's/\#\[bin\]/[bin]/' /etc/paru.conf
sed -i 's/\#Sudo/Sudo/' /etc/paru.conf

paru -S pfetch

bash


