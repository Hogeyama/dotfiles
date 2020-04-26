# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
#if [ -n "$BASH_VERSION" ]; then
#    # include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#    . "$HOME/.bashrc"
#    fi
#fi

# set PATH so it includes user's private bin if it exists
# export PATH="$HOME/.local/bin:$PATH"
# export PATH="$HOME/.cargo/bin:$PATH"
# export PATH=/usr/local/texlive/2016/bin/x86_64-linux:$PATH
# export PATH=/usr/lib/go-1.9/bin:$PATH
# export PATH=$HOME/go/bin:$PATH
# export PATH=$HOME/.cargo/bin:$PATH
# export PATH=$HOME/.npm/bin:$PATH
# export PATH=$HOME/.node_modules/bin:$PATH
# export PATH=/home/hogeyama/.cache/rebar3/bin:$PATH

# xmodmap
if [ -f "$HOME/.Xmodmap" ]; then
    xmodmap "$HOME/.Xmodmap"
fi
export PATH="$HOME/.local/bin:$PATH"

export SHELL="/usr/bin/zsh"


