# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
#export	LANG=ja_JP.EUC-JP
#export	LC_ALL=ja_JP.EUC-JP
#export	LC_CTYPE=ja_JP.EUC-JP
export	LANG=ja_JP.UTF-8
export	LC_ALL=ja_JP.UTF-8
export	LC_CTYPE=ja_JP.UTF-8
export	EDITOR=vim
export	VISUAL=${EDITOR}
export	SVN_EDITOR=${EDITOR}
export	PAGER=lv
export	LV='-Ou8'
#export	LV='-Oej'
export	PATH=/var/lib/gems/1.8/bin/:$PATH
alias less="lv"

autoload -U compinit
compinit 

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

## Default shell configuration
#
# set prompt
#
autoload -U colors
colors

case ${UID} in
0)
  PROMPT="%B%{${fg[blue]}%}%/#%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[blue]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT="%{${fg[black]}%}%%%{${reset_color}%} "
  PROMPT2="%{${fg[blue]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[black]}%}${USERNAME}@${HOST%%.*} ${PROMPT}"
  ;;
esac

setopt PROMPT_SUBST
RPROMPT="[%{${fg[blue]}%}%~%{${reset_color}%}]"

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes 
# to end of it)
#
bindkey -e

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

## Alias configuration
#
# expand aliases before completing
#
#setopt complete_aliases # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"
alias ls="ls --color"
alias tmux="tmux -u"

export TERM=xterm-color
stty -ixon

path=($HOME/bin /bin /sbin /usr/{bin,sbin/bin/bin,pkg/{,s}bin,games} /usr/pkg/java/openjdk7/bin /usr/local/{,s}bin /usr/tools/bin, /usr/sbin/)

## load user .zshrc configuration file
#
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine
