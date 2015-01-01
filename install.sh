#!/bin/bash

DOT_FILES=".screenrc .zshrc .vimrc .tmux.conf .bash_profile .bash_*_profile"

# For vim bundle
git clone http://github.com/gmarik/vundle.git ~/.vim/vundle.git

for file in ${DOT_FILES}
do
	ln -s ${HOME}/dotfiles/${file} ${HOME}/${file}
done
