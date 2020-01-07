#!/bin/bash

setxkbmap -option "caps:swapescape"
sudo add-apt-repository ppa:mmstick76/alacritty -y
sudo apt update
sudo apt install -y \
  alacritty \
  apt-transport-https \
  build-essential \
  ca-certificates \
  curl \
  fonts-firacode \
  git \
  gnome-tweaks \
  gnupg-agent \
  gnupg2 \
  libclang-dev \
  libinput-tools \
  libpq-dev \
  libssl-dev \
  libx11-dev \
  llvm \
  net-tools \
  nodejs \
  npm \
  pkg-config \
  postgresql-11 \
  postgresql-contrib \
  ripgrep \
  ruby \
  software-properties-common \
  tmux \
  tmux \
  vim-gtk3 \
  xclip \
  xdotool

sudo apt install -y docker.io  docker-compose
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock

sudo gpasswd -a $USER input
sudo gem install fusuma

mkdir -p $HOME/.config/autostart
printf "[Desktop Entry]\nName=fusuma\nExec=fusuma -d\nType=Application" > $HOME/.config/autostart/fusuma.desktop

git config --global gpg.program gpg2

./setup.sh

sudo apt autoremove nodejs npm -y
