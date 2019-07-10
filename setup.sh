#!bin/bash

setxkbmap -option "caps:swapescape"
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt update
sudo apt install libpq-dev postgresql postgresql-contrib fonts-firacode libx11-dev ripgrep curl alacritty xclip vim git libinput-tools xdotool nodejs build-essential ruby -y
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl https://sh.rustup.rs -sSf | sh

git config --global user.email "pridham.tom@gmail.com"
git config --global user.name "Tom Pridham"
git config --global core.editor "vim"

#cd ~/
#mkdir projects
#cd projects
#git clone git@github.com:TomPridham/tomfig.git
mkdir ~/.config/autostart
mkdir ~/.vim
ln -s ~/projects/tomfig/.bash ~/.bash
ln -s ~/projects/tomfig/.bashrc ~/.bashrc
ln -s ~/projects/tomfig/.bashrc ~/.bash_profile
ln -s ~/projects/tomfig/.inputrc ~/.inputrc
ln -s ~/projects/tomfig/.ripgreprc ~/.ripgreprc
ln -s ~/projects/tomfig/.vimrc ~/.vimrc
ln -s ~/projects/tomfig/coc-settings.json ~/.vim/coc-settings.json
ln -s ~/projects/tomfig/fusuma ~/.config
ln -s ~/projects/tomfig/kitty ~/.config
ln -s ~/projects/tomfig/alacritty/ ~/.config

sudo gpasswd -a $USER input
sudo gem install fusuma

printf "[Desktop Entry]\nName=fusuma\nExec=fusuma -d\nType=Application" > ~/.config/autostart/fusuma.desktop

cargo install cargo-bump cargo-edit cargo-funnel
