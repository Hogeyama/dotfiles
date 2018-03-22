#!/bin/sh
set -eu
#neovim
sudo apt-get install git python-dev python3-dev python-pip python3-pip curl xmonad opam m4 fonts-powerline
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo pip3 install --upgrade pip
sudo pip3 install neovim
sudo apt-get update
sudo apt-get install neovim xclip
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

#dein
mkdir -p ~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git ~/.nvim/dein/repos/github.com/Shougo/dein.vim

#stack
curl -sSL https://get.haskellstack.org/ | sh

#rust
curl -sSL https://sh.rustup.rs | sh
cargo install --no-default-features exa

#opam
opam init

#tex
#sudo apt-get install texlive-xetex

