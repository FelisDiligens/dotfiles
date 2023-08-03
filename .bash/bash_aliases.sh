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

# exa (https://github.com/ogham/exa)
if [ -x "$(command -v exa)" ]; then
    alias ls='exa --icons'
    alias la='exa --icons --all --group-directories-first'
    alias ll='exa --icons --all --long --header --group-directories-first'
    alias l='exa --classify --icons'
    alias tree='exa --icons --tree'
fi


# Miscellaneous aliases:
[ -x "$(command -v vim)" ] && alias vi=vim
[ -x "$(command -v neowofetch)" ] && alias neofetch=neowofetch
[ -x "$(command -v python3)" ] && alias python=python3

# Colored "cat"
[ -x "$(command -v pygmentize)" ] && alias ccat='pygmentize -g' # -O linenos=1
[ -x "$(command -v highlight)" ] && alias ccat='highlight -O ansi --line-number'
[ -x "$(command -v batcat)" ] && alias bat=batcat # batcat -> bat (https://github.com/sharkdp/bat)


# Git aliases:
if [ -x "$(command -v git)" ]; then
    alias g="git"
fi

# Package managers:
[ -x "$(command -v flatpak)" ] && alias flat=flatpak
[ -x "$(command -v zypper)" ] && alias zyp=zypper
[ -x "$(command -v pacman)" ] && alias pac=pacman
[ -x "$(command -v apt-yay)" ] && alias ay=apt-yay

# "Fixing" npm
if [ -x "$(command -v npm)" ] && [ -x "$(command -v node)" ]; then
    alias npm="node --dns-result-order=ipv4first $(which npm)"
fi


case "$(uname -sr)" in
    # WSL specific:
    Linux*WSL2*)
        if [ -x "$(command -v wslview)" ]; then
            alias xdg-open="wslview"
        fi
    ;;
    # Cygwin/MSYS specific:
    CYGWIN*|MINGW*|MSYS*)
        if [ -x "$(command -v apt-cyg)" ]; then
            alias apt="apt-cyg"
        fi
        
        alias xdg-open="explorer"
    ;;
esac


[ -x "$(command -v powershell)" ] && alias pwsh="powershell"


# Windows aliases:
alias cls="clear"
alias copy="cp"
alias move="mv"
alias ren='mv'
alias del="rm"
alias chdir="cd"