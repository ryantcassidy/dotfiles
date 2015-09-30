#!/bin/bash

if [[ -e /usr/local/bin/greadlink ]] ; then
    READLINK=/usr/local/bin/greadlink
else
    READLINK=readlink
fi

TMUX_LOC=$($READLINK -f tmux.conf)
VIM_LOC=$($READLINK -f vimrc)
ZSH_LOC=$($READLINK -f zshrc)

ln -fs $TMUX_LOC ~/.tmux.conf
ln -fs $VIM_LOC ~/.vimrc
ln -fs $ZSH_LOC ~/.zshrc
