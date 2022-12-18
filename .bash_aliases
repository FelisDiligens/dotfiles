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
alias gp="git push"


# Windows aliases:
alias cls="clear"
alias dir="ls -al --color=auto"
alias explorer="xdg-open"
alias copy="cp"
alias move="mv"
alias ren='mv'
alias del="rm"
alias ver="lsb_release -a"

if [ -x "$(command -v ifconfig)" ]; then
    alias ipconfig="ifconfig && iwconfig"
elif [ -x "$(command -v ip)" ]; then
    alias ipconfig="ip a"
else
    alias ipconfig="hostname -I"
fi

# https://unix.stackexchange.com/questions/116539/how-to-detect-the-desktop-environment-in-a-bash-script
if [ $XDG_CURRENT_DESKTOP = 'KDE' -o $DESKTOP_SESSION = 'plasma' ]; then
    alias calc="kcalc &"
    alias cmd="konsole"
    alias notepad="kate"
    alias explorer="dolphin"
fi

if [ $XDG_CURRENT_DESKTOP = 'ubuntu:GNOME' -o $XDG_CURRENT_DESKTOP = 'GNOME' -o $DESKTOP_SESSION = 'gnome' ]; then
    alias calc="gnome-calculator &"
    alias cmd="gnome-terminal"
    alias notepad="gedit"
    alias explorer="nautilus"
fi

if [ $XDG_CURRENT_DESKTOP = 'XFCE' -o $DESKTOP_SESSION = 'xfce' ]; then
    alias calc="galculator &"
    alias cmd="xfce4-terminal"
    alias notepad="mousepad"
    alias explorer="thunar"
fi


# This function emulates the "START" command found in Windows' CMD.exe:
function start {
	local cmd=""
	while (( $# > 0 )); do
		cmd="$cmd $1"
		shift
	done
	eval $cmd &>/dev/null &
}
