#!/bin/bash

setxkbmap -option "caps:swapescape"
sudo add-apt-repository ppa:mmstick76/alacritty -y
sudo apt update
sudo aptitude install -y \
  alacritty \
  apt-transport-https \
  build-essential \
  ca-certificates \
  curl \
  fonts-firacode \
  git \
  gnome-tweaks \
  gnupg-agent \
  libinput-tools \
  libpq-dev \
  libssl-dev \
  libx11-dev \
  net-tools \
  nodejs \
  npm \
  pkg-config \ 
  postgresql \
  postgresql-contrib \
  ripgrep \
  ruby \
  software-properties-common \
  tmux \
  vim-gtk3 \
  xclip \
  xdotool

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock

sudo gpasswd -a $USER input
sudo gem install fusuma

mkdir -p $HOME/.config/autostart
printf "[Desktop Entry]\nName=fusuma\nExec=fusuma -d\nType=Application" > $HOME/.config/autostart/fusuma.desktop

git config --global gpg.program gpg2

./setup.sh
