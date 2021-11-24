#!/bin/bash

curl https://sh.rustup.rs -sSf | sh
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

mkdir -p $HOME/.bash
mkdir -p $HOME/.config
mkdir -p $HOME/.config/alacritty
mkdir -p $HOME/.config/broot/launcher/bash
mkdir -p $HOME/.config/fusuma
mkdir -p $HOME/.vim

ln -s $HOME/projects/tomfig/.bash $HOME/.bash
ln -s $HOME/projects/tomfig/.bashrc $HOME/.bash_profile
ln -s $HOME/projects/tomfig/.bashrc $HOME/.bashrc
ln -s $HOME/projects/tomfig/.bashrc $HOME/.profile
ln -s $HOME/projects/tomfig/.inputrc $HOME/.inputrc
ln -s $HOME/projects/tomfig/.ripgreprc $HOME/.ripgreprc
ln -s $HOME/projects/tomfig/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/projects/tomfig/.vimrc $HOME/.vimrc
ln -s $HOME/projects/tomfig/alacritty/ $HOME/.config
ln -s $HOME/projects/tomfig/br.sh $HOME/.config/broot/launcher/bash/br
ln -s $HOME/projects/tomfig/coc-settings.json $HOME/.vim/coc-settings.json
ln -s $HOME/projects/tomfig/fusuma $HOME/.config
ln -s $HOME/projects/tomfig/starship.toml $HOME/.config
ln -s $HOME/projects/tomfig/.cargo $HOME/.cargo

source ~/projects/tomfig/.bashrc

sudo chown -R $USER /usr/local
sudo chown -R $USER /usr/local/bin
npm i -g n
n lts
n prune
npm i -g npm npx yarn webpack webpack-cli luvi

source ~/projects/tomfig/.bashrc

rustup toolchain install stable
rustup component add rls rust-analysis rust-src clippy rustfmt

source ~/projects/tomfig/.bashrc

vim -c 'PlugInstall|qa'
vim -c 'CocInstall coc-json coc-html coc-tsserver coc-css coc-rust-analyzer coc-yaml coc-highlight coc-emmet coc-snippets coc-lists coc-vimtext'

cargo install cargo-release cargo-edit cargo-funnel bat broot wasm-pack sccache cargo-make
