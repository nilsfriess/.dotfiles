#!/usr/bin/bash

[ ! -d $HOME/.emacs.d ] && ln -s `pwd`/.emacs.d/ $HOME
ln -sf `pwd`/.config/i3/config $HOME/.config/i3/config
ln -sf `pwd`/.vimrc $HOME/.vimrc
