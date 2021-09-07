#!/usr/bin/env bash

# Get disk device
lsblk
printf "Enter disk device: /dev/"
read disk
# Get swap amount
grep MemTotal /proc/meminfo
printf "Swap amount (In GiB): "
read swap
# Get net interface
ip addr
printf "Net interface: "
read interface
printf "Encryption Password: "
read password
printf "Repeat"
read password2
if [[ "$password" != "$password2" ]] then
  echo "Passwords do not match."
  exit 1
fi
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
echo "YES\n$password\n$password" | cryptsetup luksFormat $cryptbtrfs
echo "YES\n$password\n$password" | cryptsetup luksFormat $cryptswap
echo "$password" | cryptsetup luksOpen $cryptbtrfs btrfs
echo "$password" | cryptsetup luksOpen $cryptswap swap
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

