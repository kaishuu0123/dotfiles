#!/usr/bin/env bash

# Set my editor and git editor
export EDITOR="vim"
export GIT_EDITOR='vim'

case "$(uname)" in
    Darwin) # OSがMacならば
        alias ls='ls -F -G'
        alias ll='ls -G -l'
        ;;
    *) 
        alias ls='ls --color'
        alias ll='ls --color'
        ;; # OSがMac以外
esac

export PS1="[\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]]\$ "

# include file
source ~/.bash_rvm_profile
source ~/.bash_nvm_profile
source ~/.bash_grails_profile
