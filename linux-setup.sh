#!/bin/bash

setxkbmap -option "caps:swapescape"
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt update
sudo apt install -y \
  alacritty \
  build-essential \
  curl \
  fonts-firacode \
  git \
  libinput-tools \
  libpq-dev \
  libssl-dev \
  libx11-dev \
  nodejs \
  npm \
  postgresql \
  postgresql-contrib \
  ripgrep \
  ruby \
  vim-gtk3 \
  xclip \
  xdotool

sudo gpasswd -a $USER input
sudo gem install fusuma

printf "[Desktop Entry]\nName=fusuma\nExec=fusuma -d\nType=Application" > $HOME/.config/autostart/fusuma.desktop

sh setup.sh
