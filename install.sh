#!/bin/bash

## This script places a symlink to the dotfiles in this directory into
## the running user's HOME folder. Then future pulls to this repo will
## update dotfiles in place (after a re-sourcing of the configs of course)

# Macs are weird about which readlink is installed
# TODO check if non-mac `readlink` is installed at all
if [[ -e /usr/local/bin/greadlink ]] ; then
    READLINK=/usr/local/bin/greadlink
else
    READLINK=readlink
fi

TMUX_LOC=$($READLINK -f tmux.conf)
VIM_LOC=$($READLINK -f vimrc)
ZSH_LOC=$($READLINK -f zshrc)

# -f to force, -s for symlink
# TODO Announce that you're deleting what is there before the new symlink
ln -fs $TMUX_LOC ~/.tmux.conf
ln -fs $VIM_LOC ~/.vimrc
ln -fs $ZSH_LOC ~/.zshrc
