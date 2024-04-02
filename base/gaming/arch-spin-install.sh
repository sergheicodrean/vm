timedatectl status
parted /dev/sda mklabel msdos
parted /dev/sda mkpart primary 1 70GiB
parted /dev/sda mkpart primary 70GiB 100%
mkfs.ext4 /dev/sda1
mkswap /dev/sda2
mount /dev/sda1 /mnt
swapon /dev/sda2
pacman -Sy
pacman -S archlinux-keyring --noconfirm
pacstrap -K /mnt base base-devel linux linux-firmware --noconfirm
genfstab -U /mnt >> /mnt/etc/fstab


cp spin/arch-spin-chroot.sh /mnt/home
cp spin/arch-spin-root.sh /mnt/home
cp spin/arch-spin-user.sh /mnt/home
chmod a+x /mnt/home/arch-spin-chroot.sh
chmod a+x /mnt/home/arch-spin-root.sh
chmod u+x /mnt/home/arch-spin-user.sh
