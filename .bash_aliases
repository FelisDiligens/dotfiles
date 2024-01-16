#!/bin/sh

alias md='mkdir'
alias rd='rmdir'
alias xo="xdg-open"
alias g="git"

# eza (https://github.com/eza-community/eza#readme)
if [ -x "$(command -v exa)" ]; then
    alias ls='exa --icons'
    alias la='exa --icons --all --group-directories-first'
    alias ll='exa --icons --all --long --header --group-directories-first'
    alias l='exa --classify --icons'
    alias tree='exa --icons --tree'
else
    alias ll='ls -alFh --group-directories-first'
    alias la='ls -A --group-directories-first'
    alias l='ls -CF'
fi

mcd()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}