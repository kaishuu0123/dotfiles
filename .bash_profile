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

export PS1='[\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]]\$ '

# include file
#source ~/.bash_rvm_profile
#source ~/.bash_nvm_profile
#source ~/.bash_grails_profile
#source ~/.bash_goenv_profile
#source ~/.gvm/scripts/gvm
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
#source ~/Downloads/emsdk-portable/emsdk_env.sh

SESSION_NAME=ope
if [[ -z "$TMUX" && -z "$STY" ]] && type tmux >/dev/null 2>&1; then
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
  option=""
  if tmux has-session -t ${SESSION_NAME}; then
    option="attach -t ${SESSION_NAME}"
  else
    option="new -s ${SESSION_NAME}"
  fi
  tmux $option && confirm "exit?" && exit
fi

# include file
# source ~/.bash_rvm_profile
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


source ~/.bash_nvm_profile
#source ~/.bash_grails_profile

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
export PATH="$HOME/tmp/depot_tools/:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
