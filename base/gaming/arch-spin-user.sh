cd ~
#vim settings
mkdir .vim
cat > .vim/vimrc << "EOF"
set tabstop=2 
set shiftwidth=2 
set expandtab
EOF


cd ~

#make links:
ln -s /home/game-data game-data
mkdir launch
cd launch
echo "export PATH=\$PATH:\$HOME/launch" >> $HOME/.bashrc

