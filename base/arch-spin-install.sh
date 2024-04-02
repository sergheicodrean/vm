timedatectl status
parted /dev/sda mklabel msdos
parted /dev/sda mkpart primary 1 40GiB
parted /dev/sda mkpart primary 40GiB 100%
mkfs.ext4 /dev/sda1
mkswap /dev/sda2
mount /dev/sda1 /mnt
swapon /dev/sda2
pacman -Sy
pacman -S archlinux-keyring
pacstrap -K /mnt base base-devel linux linux-firmware --noconfirm
mkdir /mnt/home/shared
mount /dev/sdb1 /mnt/home/shared
genfstab -U /mnt >> /mnt/etc/fstab


cp spin/arch-spin-chroot.sh /mnt/home
cp spin/arch-spin-root.sh /mnt/home
cp spin/arch-spin-user.sh /mnt/home
chmod a+x /mnt/home/arch-spin-chroot.sh
chmod a+x /mnt/home/arch-spin-root.sh
chmod u+x /mnt/home/arch-spin-user.sh
