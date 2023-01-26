#!/bin/bash

# Enable color by default:
alias ls='ls --color=auto'
#alias dir='dir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# Typical aliases:
alias ll='ls -alFh --group-directories-first'
alias la='ls -A --group-directories-first'
alias l='ls -CF'

alias md='mkdir'
alias rd='rmdir'


# Git aliases:
alias gcl="git clone"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gall="git add -A"
alias gcm="git commit -m"
alias gac="git add -A && git commit -m" # + commit message
alias gp="git push"
alias gl="git pull"
alias gm="git merge"


# Cygwin specific:
# alias apt="apt-cyg"


# Windows aliases:
alias cls="clear"
alias copy="cp"
alias move="mv"
alias ren='mv'
alias del="rm"
alias chdir="cd"


# mkdir & chdir:
# Source: https://unix.stackexchange.com/a/125386
mcd ()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}


# This function emulates the "START" command found in Windows' CMD.exe:
function start {
	local cmd=""
	while (( $# > 0 )); do
		cmd="$cmd $1"
		shift
	done
	eval $cmd &>/dev/null &
}
