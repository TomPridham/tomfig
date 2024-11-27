#!/bin/bash

curl https://sh.rustup.rs -sSf | sh
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

mkdir -p $HOME/.config
mkdir -p $HOME/.config/broot/launcher/bash

# folders
ln -sf $HOME/projects/tomfig/.bash $HOME/
ln -sf $HOME/projects/tomfig/.vim $HOME/
ln -sf $HOME/projects/tomfig/nvim $HOME/.config/
ln -sf $HOME/projects/tomfig/alacritty $HOME/.config/
ln -sf $HOME/projects/tomfig/fusuma $HOME/.config/
ln -sf $HOME/projects/tomfig/starship.toml $HOME/.config/

# files
ln -sf $HOME/projects/tomfig/.bashrc $HOME/.bash_profile
ln -sf $HOME/projects/tomfig/.bashrc $HOME/.bashrc
ln -sf $HOME/projects/tomfig/.bashrc $HOME/.profile
ln -sf $HOME/projects/tomfig/.inputrc $HOME/.inputrc
ln -sf $HOME/projects/tomfig/.ripgreprc $HOME/.ripgreprc
ln -sf $HOME/projects/tomfig/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/projects/tomfig/.vimrc $HOME/.vimrc
ln -sf $HOME/projects/tomfig/br.sh $HOME/.config/broot/launcher/bash/br
ln -sf $HOME/projects/tomfig/.cargo $HOME/.cargo

. ~/projects/tomfig/.bashrc

sudo chown -R $USER /usr/local
sudo chown -R $USER /usr/local/bin
npm i -g n
n lts
n prune
npm i -g npm npx yarn bun luvi prettier prettier-plugin-rust neovim

source ~/projects/tomfig/.bashrc

rustup toolchain install stable
rustup component add rls rust-analysis rust-src clippy rustfmt

source ~/projects/tomfig/.bashrc

nvim -c 'PlugInstall|qa'
nvim -c 'CocInstall coc-json coc-html coc-tsserver coc-css coc-rust-analyzer coc-yaml coc-highlight coc-emmet coc-snippets coc-lists coc-vimtex'

cargo install cargo-release cargo-edit cargo-funnel bat broot wasm-pack cargo-make

git config --global push.default current
git config --global user.name "Tom Pridham"
git config --global user.email "pridham.tom@gmail.com"
