#!bin/bash

setxkbmap -option "caps:swapescape"
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt update
sudo apt install libpq-dev postgresql postgresql-contrib fonts-firacode libx11-dev ripgrep curl alacritty xclip vim-gtk3 git libinput-tools xdotool nodejs build-essential ruby -y
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl https://sh.rustup.rs -sSf | sh

git config --global user.email "pridham.tom@gmail.com"
git config --global user.name "Tom Pridham"
git config --global core.editor "vim"

#cd $HOME/
#mkdir projects
#cd projects
#git clone git@github.com:TomPridham/tomfig.git
mkdir $HOME/.config/autostart
mkdir $HOME/.vim
ln -s $HOME/projects/tomfig/.bash $HOME/.bash
ln -s $HOME/projects/tomfig/.bashrc $HOME/.bashrc
ln -s $HOME/projects/tomfig/.bashrc $HOME/.bash_profile
ln -s $HOME/projects/tomfig/.inputrc $HOME/.inputrc
ln -s $HOME/projects/tomfig/.ripgreprc $HOME/.ripgreprc
ln -s $HOME/projects/tomfig/.vimrc $HOME/.vimrc
ln -s $HOME/projects/tomfig/coc-settings.json $HOME/.vim/coc-settings.json
ln -s $HOME/projects/tomfig/fusuma $HOME/.config
ln -s $HOME/projects/tomfig/kitty $HOME/.config
ln -s $HOME/projects/tomfig/alacritty/ $HOME/.config

vim -c 'PlugInstall|q'
vim -c 'CocInstall -sync coc-json coc-html coc-tsserver coc-css coc-rls coc-yaml coc-highlight coc-emmet coc-snippets coc-lists|q'

sudo gpasswd -a $USER input
sudo gem install fusuma

printf "[Desktop Entry]\nName=fusuma\nExec=fusuma -d\nType=Application" > $HOME/.config/autostart/fusuma.desktop

cargo install cargo-bump cargo-edit cargo-funnel
