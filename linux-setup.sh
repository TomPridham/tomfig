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
  vim-gtk3 \
  xclip \
  xdotool

curl -sS https://download.jetbrains.com/fonts/JetBrainsMono-1.0.0.zip > jbmono.zip
mkdir ~/.fonts
mv jbmono.zip ~/.fonts/
unzip jbmono.zip
rm jbmono.zip
sudo fc-cache -f -v

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
