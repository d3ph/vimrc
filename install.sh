#!/bin/bash
set +e

sudo apt-get install vim-nox
bashrc=~/.bash_profile
inject_bashrc="source ~/vimrc/$(basename $bashrc)"

test -f $bashrc && grep -q -F "$inject_bashrc" $bashrc || echo "$inject_bashrc" >> $bashrc

. $bashrc

unset inject_bashrc bashrc
