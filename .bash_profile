#!/usr/bin/env bash

# Set my editor and git editor
export EDITOR="vim"
export GIT_EDITOR='vim'

dotfiles_dir=$(pwd -L)

case "$(uname)" in
  Darwin) # OSがMacならば
    eval $(gdircolors ${dotfiles_dir}/dircolors-solarized/dircolors.ansi-universal)
    alias ls='gls --color'
    alias ll='gls --color -l'
    ;;
  *) 
    eval $(dircolors ${dotfiles_dir}/dircolors-solarized/dircolors.ansi-universal)
    alias ls='ls --color'
    alias ll='ls --color'
    ;; # OSがMac以外
esac

export PS1="[\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]]\$ "

# include file
#source ~/.bash_rvm_profile
#source ~/.bash_nvm_profile
#source ~/.bash_grails_profile
