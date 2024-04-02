pacman -S archlinux-keyring --noconfirm
pacman -Syyu --noconfirm
pacman -S sudo --noconfirm
useradd -m -g wheel kenny
passwd kenny
echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers
pacman -S xorg-server xorg-xinit git --noconfirm
pacman -S xorg-xrandr --noconfirm
pacman -S libxft libxinerama --noconfirm
#pacman -S ttf-liberation
pacman -S ttf-liberation-mono-nerd --noconfirm
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
pacman -S stylua unzip ripgrep wget --noconfirm
pacman -S clang gdb --noconfirm
#pacman -S tree-sitter-cli
#pacman -S lazygit



pacman -S cmake --noconfirm
pacman -S sfml --noconfirm
pacman -S lua --noconfirm



chown kenny /home/arch-spin-chroot.sh
chown kenny /home/arch-spin-root.sh
chown kenny /home/arch-spin-user.sh
chgrp wheel /home/arch-spin-chroot.sh
chgrp wheel /home/arch-spin-root.sh
chgrp wheel /home/arch-spin-user.sh

