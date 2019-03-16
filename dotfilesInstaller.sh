#!/bin/sh
if [ ! -d ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim
fi

ln -s ~/dotfiles/.profile              ~/.profile
ln -s ~/dotfiles/.bashrc               ~/.bashrc
ln -s ~/dotfiles/.bashenv              ~/.bashenv
ln -s ~/dotfiles/.bash_aliases         ~/.bash_aliases
ln -s ~/dotfiles/.zshrc                ~/.zshrc
ln -s ~/dotfiles/.zshenv               ~/.zshenv
ln -s ~/dotfiles/.zsh_alias            ~/.zsh_alias

ln -s ~/dotfiles/nvim/init.vim         ~/.config/nvim/init.vim
ln -s ~/dotfiles/nvim/ginit.vim        ~/.config/nvim/ginit.vim
ln -s ~/dotfiles/nvim/indent           ~/.config/nvim/indent
ln -s ~/dotfiles/nvim/snippets         ~/.config/nvim/snippets

ln -s ~/dotfiles/.apvlvrc              ~/.apvlvrc
ln -s ~/dotfiles/.latexmkrc            ~/.latexmkrc
ln -s ~/dotfiles/.pandoc               ~/.pandoc
ln -s ~/dotfiles/.Xmodmap              ~/.Xmodmap
ln -s ~/dotfiles/.xmobarrc             ~/.xmobarrc
ln -s ~/dotfiles/.xmonad               ~/.xmonad

