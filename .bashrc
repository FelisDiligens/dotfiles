#!/bin/bash

# History
HISTCONTROL=ignoredups
shopt -s histappend
HISTSIZE=500
HISTFILESIZE=500

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# Source aliases:
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Source functions:
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi


# Configure shell prompt depending on system:
case "$(uname -sr)" in
    Linux*WSL2*)
        PS1="\[\e]0;WSL: \W\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\W\[\e[0m\]\n\$ "
        ;;
    CYGWIN*|MINGW*|MINGW32*|MSYS*)
        if [ "$(isadmin)" == "admin" ]; then
            PS1="\[\e]0;\W\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\W\[\e[0m\]\n# "
        else
            PS1="\[\e]0;\W\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\W\[\e[0m\]\n\$ "
        fi
        ;;
    *)
        #        Window title                       Command prompt
        #     |----------------|            |-------------------------------|
        PS1="\[\e]0;\u@\h \W\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\W\[\e[0m\]\n\$ "
        ;;
esac

# If starship (fancy shell prompt) is installed, use that instead:
if [ -x "$(command -v starship)" ]; then
    function set_win_title(){
        echo -ne "\033]0; $(basename "$PWD") \007"
    }
    starship_precmd_user_func="set_win_title"

    eval "$(starship init bash)"
fi
