#!/bin/sh

#neovim
sudo apt-get install git python-dev python3-dev python-pip python3-pip
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

#dein
if [ ! -d ~/.nvim/dein/repos/github.com/Shougo/dein.vim ]
    mkdir -p ~/.nvim/dein/repos/github.com/Shougo/dein.vim
fi
git clone https://github.com/Shougo/dein.vim.git ~/.nvim/dein/repos/github.com/Shougo/dein.vim

#stack
curl -sSL https://get.haskellstack.org/ | sh

#opam
sudo apt-get install opam
opam init

#tex
#sudo apt-get install texlive-xetex

