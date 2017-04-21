#!/bin/sh
if [ ! -d ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim
fi

if [ ! -d ~/.i3 ]; then
    mkdir ~/.i3
fi

ln -sf ~/dotfiles/.profile      ~/.profile
ln -sf ~/dotfiles/.bashrc       ~/.bashrc
ln -sf ~/dotfiles/.bashenv      ~/.bashenv
ln -sf ~/dotfiles/.bash_alias   ~/.bash_alias
ln -sf ~/dotfiles/.zshrc        ~/.zshrc
ln -sf ~/dotfiles/.zshenv       ~/.zshenv
ln -sf ~/dotfiles/.zsh_aliases  ~/.zsh_aliases
ln -sf ~/dotfiles/.apvlvrc      ~/.apvlvrc
ln -sf ~/dotfiles/.latexmkrc    ~/.latexmkrc
ln -sf ~/dotfiles/.latex        ~/.latex
ln -sf ~/dotfiles/.pandoc       ~/.pandoc
ln -sf ~/dotfiles/.Xmodmap      ~/.Xmodmap
ln -sf ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/nvim/indent   ~/.nvim/indent
ln -sf ~/dotfiles/nvim/snippets ~/.nvim/snippets

