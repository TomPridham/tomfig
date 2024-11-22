#!/bin/bash

sudo apt update
sudo apt install -y \
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


sudo snap install alacritty nvim
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

curl -LsS -N https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip -o ~/.fonts/jbmono_nf.zip --create-dirs
unzip ~/.fonts/jbmono_nf.zip -d /usr/local/share/fonts
fc-cache -f -v
