#!/bin/bash

setxkbmap -option "caps:swapescape"
sudo add-apt-repository ppa:mmstick76/alacritty -y
sudo apt update
sudo aptitude install -y \
  alacritty \
  build-essential \
  curl \
  fonts-firacode \
  git \
  gnome-tweaks \
  libinput-tools \
  libpq-dev \
  libssl-dev \
  libx11-dev \
  nodejs \
  npm \
  pkg-config \ 
  postgresql \
  postgresql-contrib \
  ripgrep \
  ruby \
  tmux \
  vim-gtk3 \
  xclip \
  xdotool

sudo gpasswd -a $USER input
sudo gem install fusuma

mkdir -p $HOME/.config/autostart
printf "[Desktop Entry]\nName=fusuma\nExec=fusuma -d\nType=Application" > $HOME/.config/autostart/fusuma.desktop

git config --global gpg.program gpg2

./setup.sh
