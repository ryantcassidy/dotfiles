#!/bin/bash

TMUX_LOC=$(readlink -f tmux.conf)
VIM_LOC=$(readlink -f vimrc)
ZSH_LOC=$(readlink -f zshrc)

ln -s $TMUX_LOC ~/.tmux.conf
ln -s $VIM_LOC ~/.vimrc
ln -s $ZSH_LOC ~/.zshrc
