#!/bin/sh

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

alias xo="xdg-open"

# eza (https://github.com/eza-community/eza#readme)
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
[ -x "$(command -v batcat)" ] && alias bat=batcat # batcat -> bat (https://github.com/sharkdp/bat)


# Git aliases:
if [ -x "$(command -v git)" ]; then
    alias g="git"
fi

# Package managers:
[ -x "$(command -v flatpak)" ] && alias flat=flatpak
[ -x "$(command -v zypper)" ] && alias zyp=zypper
[ -x "$(command -v pacman)" ] && alias pac=pacman

# "Fixing" npm
# if [ -x "$(command -v npm)" ] && [ -x "$(command -v node)" ]; then
#     alias npm='node --dns-result-order=ipv4first $(which npm)'
# fi

# snap packages
if [ -x "$(command -v snap)" ]; then
    alias lsblk="lsblk -e 7"
    # if snap list | grep -q -E "clipboard.*bachatero"; then
    #     alias cb="snap run clipboard"
    # fi
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
