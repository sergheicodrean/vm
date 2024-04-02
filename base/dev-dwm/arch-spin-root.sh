pacman -S archlinux-keyring
pacman -Syyu
pacman -S sudo
useradd -m -g wheel kenny
passwd kenny
echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers
pacman -S xorg-server xorg-xinit git
pacman -S xorg-xrandr
pacman -S libxft libxinerama
pacman -S ttf-liberation
pacman -S xcompmgr
#for yay
pacman -S go
pacman -S neovim vim
pacman -S firefox
pacman -S nitrogen
pacman -S pcmanfm
pacman -S lxappearance
#for neovim
pacman -S nodejs
pacman -S cmake
pacman -S sfml
pacman -S lua

chown kenny /home/arch-spin-chroot.sh
chown kenny /home/arch-spin-root.sh
chown kenny /home/arch-spin-user.sh
chgrp wheel /home/arch-spin-chroot.sh
chgrp wheel /home/arch-spin-root.sh
chgrp wheel /home/arch-spin-user.sh

