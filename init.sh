#!/bin/sh
set -eu

#
sudo apt-get update
sudo apt-get install git python-dev python3-dev python-pip python3-pip libfuse-dev curl xmonad m4 fonts-powerline xclip

# Neovim
curl https://github.com/neovim/neovim/releases/download/v0.3.4/nvim.appimage -L -o nvim
mkdir -p ~/.local/bin
mv nvim ~/.local/bin
sudo pip3 install --upgrade pip
sudo pip3 install neovim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
## Plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# stack
curl -sSL https://get.haskellstack.org/ | sh

# rust
curl -sSL https://sh.rustup.rs | sh
cargo install --no-default-features exa

# opam
sudo apt-get install opam
opam init

#tex
#sudo apt-get install texlive-xetex

