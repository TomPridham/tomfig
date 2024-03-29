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
  ripgrep \
  ruby \
  software-properties-common \
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

curl -LsS -N https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip -o ~/.fonts/jbmono_nf.zip --create-dirs
echo unzip font file
