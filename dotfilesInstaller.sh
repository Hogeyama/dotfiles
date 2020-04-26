#!/bin/sh
if [ ! -d ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim
fi

if [ $SHELL = "/usr/bin/zsh" ]; then # FIXME ガバガバ判定
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
elif [ $SHELL = "/bin/bash" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
fi

ln -sf ~/dotfiles/profile                ~/.profile
ln -sf ~/dotfiles/shenv                  ~/.bashenv
ln -sf ~/dotfiles/shenv                  ~/.zshenv
ln -sf ~/dotfiles/sh_aliases             ~/.bash_aliases
ln -sf ~/dotfiles/sh_aliases             ~/.zsh_aliases
ln -sf ~/dotfiles/bashrc                 ~/.bashrc
ln -sf ~/dotfiles/zshrc                  ~/.zshrc

ln -sf ~/dotfiles/nvim/init.vim          ~/.config/nvim/init.vim
ln -sf ~/dotfiles/nvim/ginit.vim         ~/.config/nvim/ginit.vim
ln -sf ~/dotfiles/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s  ~/dotfiles/nvim/indent            ~/.config/nvim/indent
ln -s  ~/dotfiles/nvim/snippets          ~/.config/nvim/snippets

ln -sf ~/dotfiles/latexmkrc              ~/.latexmkrc
ln -sf ~/dotfiles/Xmodmap                ~/.Xmodmap
ln -s  ~/dotfiles/.pandoc                ~/.pandoc
ln -s  ~/dotfiles/.xmonad                ~/.xmonad

