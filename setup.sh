#!/bin/bash

curl https://sh.rustup.rs -sSf | sh

. ~/projects/tomfig/.bashrc

npm i -g n && \
  n latest && \
  npm i -g npm npx

. ~/projects/tomfig/.bashrc

rustup toolchain install stable

. ~/projects/tomfig/.bashrc

mkdir -p $HOME/.config/autostart
mkdir -p $HOME/.vim
ln -s $HOME/projects/tomfig/.bash $HOME/.bash
ln -s $HOME/projects/tomfig/.tmux.conf $HOME/.tmux.conf
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

cargo install cargo-bump cargo-edit cargo-funnel
