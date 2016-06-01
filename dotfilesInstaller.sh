#!/bin/sh
if [ ! -d ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim
fi

if [ ! -d ~/.i3 ]; then
    mkdir ~/.i3
fi

ln -sf ~/dotfiles/.profile         ~/.profile
ln -sf ~/dotfiles/.bashrc          ~/.bashrc
ln -sf ~/dotfiles/.bashenv         ~/.bashenv
ln -sf ~/dotfiles/.bash_aliases    ~/.bash_aliases
ln -sf ~/dotfiles/.latexmkrc       ~/.latexmkrc
ln -sf ~/dotfiles/.latex           ~/.latex
ln -sf ~/dotfiles/.pandoc          ~/.pandoc
ln -sf ~/dotfiles/init.vim         ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.Xmodmap         ~/.Xmodmap
ln -sf ~/dotfiles/.i3/config       ~/.i3/config
