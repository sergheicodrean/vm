cd ~
mkdir install-sources
cd install-sources
git clone git://git.suckless.org/dwm
git clone git://git.suckless.org/dmenu
git clone git://git.suckless.org/st

#apply patches
cd dwm
patch ./dwm.c /home/shared/patches/dwm_dwm.c
patch ./config.def.h /home/shared/patches/dwm_config.def.h
cd ../st
#shift-pg up/down for scroll
patch -p1 < /home/shared/patches/st_scrollback.diff
#patch -p1 < /home/shared/patches/st_scrollback_reflow.diff
#patch -p1 < /home/shared/patches/st_scrollback_mouse.diff
patch -p1 < /home/shared/patches/st_anysize.diff
patch -p1 < /home/shared/patches/st_alpha.diff
#patch ./config.def.h /home/shared/patches/st_config.def.h
cd ../dmenu
patch ./config.def.h /home/shared/patches/dmenu_config.def.h

cd ~

#xorg settings
cat > .xinitrc << "EOF"
[ -f ~/.xprofile ] && . ~/.xprofile
exec dwm
EOF
cat > .xprofile << "EOF"
/home/shared/scripts/setwindow.sh
/home/shared/scripts/setbackground.sh
xcompmgr -c &
EOF
echo "startx" >> .bash_profile

#vim settings
mkdir .vim
cat > .vim/vimrc << "EOF"
set tabstop=2 
set shiftwidth=2 
set expandtab
EOF

#terminal prompt
cat >> .bashrc << "EOF"
parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' 
}
PS1="\e[2;37;40m\u \e[0m\e[1;31;40m\$(parse_git_branch)\e[0m\e[1;35;40m\w \e[0m\e[2;37;40m\$\e[0m\n"
EOF

#install yay:
cd install-sources
git clone https://aur.archlinux.org/yay.git

cd ~

#make links:
ln -s /home/shared/source source
ln -s /home/shared shared
mkdir launch
cd launch
ln -s /home/shared/scripts/setbackground.sh setbackground
ln -s /home/shared/scripts/setfullscreen.sh setfullscreen
ln -s /home/shared/scripts/setwindow.sh setwindow
ln -s /home/shared/scripts/setswindow.sh setswindow
echo "export PATH=\$PATH:\$HOME/launch" >> $HOME/.bashrc

cd ~

#.NET
echo "export DOTNET_ROOT=\$HOME/.dotnet" >> .bashrc
echo "export PATH=\$PATH:\$DOTNET_ROOT:\$DOTNET_ROOT/tools" >> .bashrc

#neovim
mkdir ~/.config
cp /home/shared/vim-configs/nvim ~/.config

#vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#gtk themes
mkdir $HOME/.themes
cp /home/shared/themes/* $HOME/.themes -r

#dotnet:
mkdir $HOME/Downloads
curl https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh -o $HOME/Downloads/dotnet-install.sh
chmod u+x $HOME/Downloads/dotnet-install.sh
