#!/bin/bash

curl https://sh.rustup.rs -sSf | sh

source ~/projects/tomfig/.bashrc

sudo chown -R $USER /usr/local
npm i -g n
n lts
n prune
npm i -g npm npx yarn webpack webpack-cli

source ~/projects/tomfig/.bashrc

rustup toolchain install stable
rustup component add rls rust-analysis rust-src clippy rustfmt

source ~/projects/tomfig/.bashrc

mkdir -p $HOME/.vim
[ ! -d "$HOME/.bash" ] && ln -s $HOME/projects/tomfig/.bash $HOME/.bash
ln -s $HOME/projects/tomfig/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/projects/tomfig/.bashrc $HOME/.bashrc
ln -s $HOME/projects/tomfig/.bashrc $HOME/.bash_profile
ln -s $HOME/projects/tomfig/.inputrc $HOME/.inputrc
ln -s $HOME/projects/tomfig/.ripgreprc $HOME/.ripgreprc
ln -s $HOME/projects/tomfig/.vimrc $HOME/.vimrc
ln -s $HOME/projects/tomfig/coc-settings.json $HOME/.vim/coc-settings.json
[ ! -d "$HOME/.config/fusuma" ] && ln -s $HOME/projects/tomfig/fusuma $HOME/.config
[ ! -d "$HOME/.config/kitty" ] && ln -s $HOME/projects/tomfig/kitty $HOME/.config
[ ! -d "$HOME/.config/alacritty" ] && ln -s $HOME/projects/tomfig/alacritty/ $HOME/.config

vim -c 'PlugInstall|qa'
vim -c 'CocInstall coc-json coc-html coc-tsserver coc-css coc-rust-analyzer coc-yaml coc-highlight coc-emmet coc-snippets coc-lists coc-vimtext|qa'

cargo install cargo-bump cargo-edit cargo-funnel bat broot sccache

curl -sS https://github.com/JetBrains/JetBrainsMono/releases/download/v2.001/JetBrains.Mono.2.001.zip -o /usr/share/fonts/jbmono.zip
echo unzip font file and move to ~/.local/share/fonts
