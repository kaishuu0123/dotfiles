#!/usr/bin/env bash

# Set my editor and git editor
export EDITOR="vim"
export GIT_EDITOR='vim'

dotfiles_dir=$(dirname `readlink $HOME/.bash_profile`)

case "$(uname)" in
  Darwin) # OSがMacならば
    eval $(gdircolors ${dotfiles_dir}/dircolors-kaishuu0123/dircolors)
    alias ls='gls --color -F'
    alias ll='gls --color -l -F'
    ;;
  *) 
    eval $(dircolors ${dotfiles_dir}/dircolors-kaishuu0123/dircolors)
    alias ls='ls --color -F'
    alias ll='ls --color -l -F'
    ;; # OSがMac以外
esac

export PS1="[\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]]\$ "

# include file
#source ~/.bash_rvm_profile
#source ~/.bash_nvm_profile
#source ~/.bash_grails_profile
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

if [[ -z "$TMUX" && -z "$STY" ]] && type tmux >/dev/null 2>&1; then
  echo "hogehoge"
  function confirm {
    MSG=$1
    while :
    do
      echo -n "${MSG} [Y/N]: "
      read ans
      case $ans in
        [yY]) return 0 ;;
        [nN]) return 1 ;;
      esac
    done
  }
  echo "hogehoge"
  option=""
  if tmux has-session -t ope; then
    option="attach -t ope"
  else
    option="new -s ope"
  fi
  tmux $option && confirm "exit?" && exit
fi
