#!/bin/bash

TMUX_LOC=$(readlink -f tmux.conf)
VIM_LOC=$(readlink -f vimrc)
ZSH_LOC=$(readlink -f zshrc)

ln -fs $TMUX_LOC ~/.tmux.conf
ln -fs $VIM_LOC ~/.vimrc
ln -fs $ZSH_LOC ~/.zshrc
