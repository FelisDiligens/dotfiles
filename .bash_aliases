#!/bin/bash

# Enable color by default:
alias ls='ls --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# Typical aliases:
alias ll='ls -alFh --group-directories-first'
alias la='ls -A --group-directories-first'
alias l='ls -CF'

alias md='mkdir'
alias rd='rmdir'


# Miscellaneous aliases:
if [ -x "$(command -v vim)" ]; then
    alias vi=vim
fi


# Git aliases:
if [ -x "$(command -v git)" ]; then
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
fi


case "$(uname -sr)" in
    # WSL specific:
    Linux*WSL2*)
        if [ -x "$(command -v wsl-open)" ]; then
            alias xdg-open="wsl-open"
        fi
    ;;
    # Cygwin/MSYS specific:
    CYGWIN*|MINGW*|MSYS*)
        if [ -x "$(command -v apt-cyg)" ]; then
            alias apt="apt-cyg"
        fi
        
        alias xdg-open="explorer"
        alias psh="powershell"
    ;;
esac


# Windows aliases:
alias cls="clear"
alias copy="cp"
alias move="mv"
alias ren='mv'
alias del="rm"
alias chdir="cd"
