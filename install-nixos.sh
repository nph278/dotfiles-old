#!/usr/bin/env bash

# Need root access

if [[ $USER != "root" ]]; then
  echo "Run with sudo."
  exit 1
fi

# Get disk device

printf "Enter disk device: /dev/"
read disk

# Get swap amount
printf "Swap amount (In GiB): "
read swap

# Partition disk

parted "/dev/$disk" -s "mklabel gpt \
  mkpart primary 512MiB -${swap}GiB
  mkpart primary -${swap}GiB 100%
  mkpart ESP fat32 1MiB 512MiB
  set 3 esp on
  name 1 crypt-btrfs
  name 2 crypt-swap
  name 3 efi
  "

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
umount /mnt

# Create swap

mkswap $swap
swapon $swap

# Mount filesystems

mount $btrfs -o defaults,subvol=@ /mnt
mkdir /mnt/home
mkdir /mnt/.snapshots
mount $btrfs -o defaults,subvol=@home /mnt/home
mount $btrfs -o defaults,subvol=@snapshots /mnt/.snapshots
mkdir /mnt/boot
mount $efi /mnt/boot

# Create NixOS config

nixos-generate-config --root /mnt
# cp ./configuration.nix /mnt/etc/nixos/configuration.nix

# Install!

# nixos-install

