pacman -S archlinux-keyring --noconfirm
pacman -Syyu --noconfirm
pacman -S sudo --noconfirm
useradd -m -g wheel gamer
passwd gamer
echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers
pacman -S xorg-server xorg-xinit git --noconfirm
pacman -S xorg-xrandr --noconfirm
pacman -S libxft libxinerama --noconfirm
pacman -S ttf-liberation --noconfirm
pacman -S xcompmgr --noconfirm
#for yay
pacman -S go --noconfirm
pacman -S neovim vim --noconfirm
pacman -S firefox --noconfirm
pacman -S nitrogen --noconfirm
pacman -S pcmanfm --noconfirm
pacman -S lxappearance --noconfirm
#for neovim
pacman -S nodejs --noconfirm

pacman -S qbittorrent --noconfirm
pacman -S wine --noconfirm
cat >> /etc/pacman.conf << "EOF"
[multilib]
Include = /etc/pacman.d/mirrorlist
EOF
pacman -Sy --noconfirm
pacman -S steam --noconfirm
pacman -S xfce4 --noconfirm
pacman -S xfce4-goodies --noconfirm

chown gamer /home/arch-spin-chroot.sh
chown gamer /home/arch-spin-root.sh
chown gamer /home/arch-spin-user.sh
chgrp wheel /home/arch-spin-chroot.sh
chgrp wheel /home/arch-spin-root.sh
chgrp wheel /home/arch-spin-user.sh

