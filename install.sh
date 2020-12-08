#!/bin/bash

## WARNING: IF A DOTFILE BEING INSTALLED ALREADY EXISTS, IT WILL BE OVERWRITTEN
## Installation is via soft link, so `git pull` in the folder this repo is cloned
## in will update dotfiles in place. 

# Homebrew installed greadlink
if [[ -e /usr/local/bin/greadlink ]] ; then
    READLINK=/usr/local/bin/greadlink
# Mac w/o greadlink
elif [[ "$uname" == 'Darwin' ]] ; then
    echo "Run <brew install coreutils> to get greadlink on this system"
    exit
# Linux, presumably
else
    READLINK=readlink
fi

TMUX_LOC=$($READLINK -f tmux.conf)
VIM_LOC=$($READLINK -f vimrc)
ZSH_LOC=$($READLINK -f zshrc)

read -p "This will overwrite ~/.tmux.conf, ~/.vimrc, and ~/.zshrc. Press y to continue" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # -f to force, -s for symlink, -v for verbose
    ln -vfs $TMUX_LOC ~/.tmux.conf
    ln -vfs $VIM_LOC ~/.vimrc
    ln -vfs $ZSH_LOC ~/.zshrc
else
    echo "Did nothing"
fi
