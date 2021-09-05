#!/usr/bin/env bash

# Need root access

if [[ $USER != "root" ]]; then
  echo "Run with sudo."
  exit 1
fi

# Get disk device

lsblk
printf "Enter disk device: /dev/"
read disk

# Get swap amount
grep MemTotal /proc/meminfo
printf "Swap amount (In GiB): "
read swap

# Get hostname
printf "Hostname: "
read hostname

# Get net interface
ifconfig
printf "Net interface: "
read interface

# Get wireless
printf "Wireless support (true/false): "
read wireless

# Partition disk

echo "Partitioning disks..."
parted "/dev/$disk" -- "mklabel gpt"
parted "/dev/$disk" -- "mkpart ESP fat32 1MiB 1GiB"
parted "/dev/$disk" -- "set 1 esp on"
parted "/dev/$disk" -- "mkpart primary 1GiB $[swap+1]GiB"
parted "/dev/$disk" -- "mkpart primary $[swap+1]GiB 100%"
parted "/dev/$disk" -- "name 1 efi"
parted "/dev/$disk" -- "name 2 crypt-swap"
parted "/dev/$disk" -- "name 3 crypt-btrfs"

# Shorthands

efi="/dev/disk/by-partlabel/efi"
cryptbtrfs="/dev/disk/by-partlabel/crypt-btrfs"
cryptswap="/dev/disk/by-partlabel/crypt-swap"
btrfs="/dev/mapper/btrfs"
swap="/dev/mapper/swap"

# Format ESP

mkfs.fat -F 32 $efi

# Encrypt partitions

cryptsetup luksFormat $cryptbtrfs
cryptsetup luksFormat $cryptswap
cryptsetup luksOpen $cryptbtrfs btrfs
cryptsetup luksOpen $cryptswap swap

# Create btrfs partition and subvolumes

mkfs.btrfs -f $btrfs
mount $btrfs /mnt
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@snapshots
btrfs subvolume create /mnt/@nix
umount /mnt

# Create swap

mkswap $swap
swapon $swap

# Mount filesystems

mount $btrfs -o defaults,subvol=@ /mnt
mkdir /mnt/home
mkdir /mnt/nix
mkdir /mnt/.snapshots
mount $btrfs -o defaults,subvol=@home /mnt/home
mount $btrfs -o defaults,subvol=@snapshots /mnt/.snapshots
mount $btrfs -o defaults,subvol=@nix /mnt/nix
mkdir /mnt/boot
mount $efi /mnt/boot

# Create NixOS config

nixos-generate-config --root /mnt
cp ./configuration.nix /mnt/etc/nixos/configuration.nix
sed -i s/%%HOSTNAME%%/$hostname/ /mnt/etc/nixos/configuration.nix
sed -i s/%%INTERFACE%%/$interface/ /mnt/etc/nixos/configuration.nix
sed -i s/%%WIRELESS%%/$wireless/ /mnt/etc/nixos/configuration.nix
grep -v boot.initrd.luks /mnt/etc/nixos/hardware-configuration.nix > tmpfile
cp tmpfile /mnt/etc/nixos/hardware-configuration.nix
rm tmpfile

# Install!

nixos-install

# Create directories in home folder
mkdir /mnt/home/carl/{Pictures,Projects,Music,Downloads,Documents}

# Run enter script

cp enter.sh /mnt/home/carl/
nixos-enter --root /mnt -c "sudo -u carl /home/carl/enter.sh"

echo "Installation complete!"

