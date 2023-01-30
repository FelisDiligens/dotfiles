#!/bin/bash

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# Set shell prompt depending on platform:
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
