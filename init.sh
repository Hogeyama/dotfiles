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
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 575159689BEFB442
echo 'deb http://download.fpcomplete.com/ubuntu trusty main'| sudo tee /etc/apt/sources.list.d/fpco.list
sudo apt-get update && sudo apt-get install stack -y

#opam
sudo add-apt-repository ppa:avsm/ppa
sudo apt-get update
sudo apt-get install ocaml ocaml-native-compilers camlp4-extra opam

#others
sudo apt-get install i3
sudo apt-get install texlive-xetex

