#!/bin/bash

sudo apt-get install vim-nox
bashrc=~/.bashrc
inject_bashrc="source ~/vimrc/$(basename $bashrc)"

test -f $bashrc && grep -q -F "$inject_bashrc" $bashrc || echo "$inject_bashrc" >> $bashrc

. $bashrc

unset inject_bashrc bashrc
