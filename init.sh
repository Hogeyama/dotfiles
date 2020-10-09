#!/bin/bash
set -eu

# shell
#######

if [[ $SHELL =~ zsh$ ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
elif [[ $SHELL =~ bash ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
fi
ln -sf ~/dotfiles/profile                ~/.profile
ln -sf ~/dotfiles/sh_aliases             ~/.bash_aliases
ln -sf ~/dotfiles/bashrc                 ~/.bashrc
ln -sf ~/dotfiles/sh_aliases             ~/.zsh_aliases
ln -sf ~/dotfiles/zshrc                  ~/.zshrc

# nvim
######

curl -fLo ~/.local/bin/nvim --create-dirs \
  https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod +x ~/.local/bin/nvim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf ~/dotfiles/nvim/init.vim  ~/.config/nvim/init.vim
ln -s  ~/dotfiles/nvim/indent    ~/.config/nvim/indent
ln -s  ~/dotfiles/nvim/snippets  ~/.config/nvim/snippets

