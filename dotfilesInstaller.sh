#!/bin/sh
if [ ! -d ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim
fi

ln -sf ~/dotfiles/.profile              ~/.profile
ln -sf ~/dotfiles/.bashrc               ~/.bashrc
ln -sf ~/dotfiles/.bashenv              ~/.bashenv
ln -sf ~/dotfiles/.bash_aliases         ~/.bash_aliases
ln -sf ~/dotfiles/.zshrc                ~/.zshrc
ln -sf ~/dotfiles/.zshenv               ~/.zshenv
ln -sf ~/dotfiles/.zsh_alias            ~/.zsh_alias

ln -sf ~/dotfiles/nvim/init.vim         ~/.config/nvim/init.vim
ln -sf ~/dotfiles/nvim/ginit.vim        ~/.config/nvim/ginit.vim
ln -sf ~/dotfiles/nvim/indent           ~/.config/nvim/indent
ln -sf ~/dotfiles/nvim/snippets         ~/.config/nvim/snippets

ln -sf ~/dotfiles/.apvlvrc              ~/.apvlvrc
ln -sf ~/dotfiles/.latexmkrc            ~/.latexmkrc
ln -sf ~/dotfiles/.pandoc               ~/.pandoc
ln -sf ~/dotfiles/.Xmodmap              ~/.Xmodmap
ln -sf ~/dotfiles/.xmobarrc             ~/.xmobarrc
ln -sf ~/dotfiles/.xmonad               ~/.xmonad

