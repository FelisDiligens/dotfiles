#!/bin/bash

# For 'sudoedit':
export EDITOR="vim"

# PATH
if [ -d "$HOME/.local/bin" ]; then
    PATH=$PATH:$HOME/.local/bin
fi

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

# Source completions:
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi


# Determine SHELLNAME
case "$(uname -sr)" in
    Linux*WSL2*) export SHELLNAME="WSL";;
    Linux*android*) export SHELLNAME="Termux";;
    Linux*)
        if [ -x "$(command -v lsb_release)" ]; then
            export SHELLNAME="$(lsb_release -is)"
        else
            export SHELLNAME="$(uname -o)"
        fi
        ;;
    CYGWIN*) export SHELLNAME="Cygwin";;
    MINGW*|MINGW32*|MSYS*) export SHELLNAME="MSYS2";;
    *) export SHELLNAME="$(uname -o)";;
esac


# Determine TELETYPE and TELETYPE_NUMBER
TELETYPE="PTY"
if [ "$(uname -s)" == "Linux" ] && ! tty | grep -q "pts"; then
    TELETYPE="TTY"
fi
TELETYPE_NUMBER=$(tty | sed s/[^0-9]*//)


# Configure shell prompt depending on system:
case "$(uname -sr)" in
    Linux*WSL2*)
        PS1="\[\e]0;\W\a\]\n\[\e[32m\]\u@\h \[\033[35m\]$SHELLNAME \[\e[33m\]\W\[\e[0m\]\n\$ "
        ;;
    CYGWIN*|MINGW*|MINGW32*|MSYS*)
        if [ "$(isadmin)" == "admin" ]; then
            PS1="\[\e]0;\W\a\]\n\[\e[32m\]\u@\h \[\033[35m\]$SHELLNAME \[\e[33m\]\W\[\e[0m\]\n# "
        else
            PS1="\[\e]0;\W\a\]\n\[\e[32m\]\u@\h \[\033[35m\]$SHELLNAME \[\e[33m\]\W\[\e[0m\]\n\$ "
        fi
        ;;
    *)
        #        Window title                       Command prompt
        #     |----------------|            |-------------------------------|
        PS1="\[\e]0;\u@\h \W\a\]\n\[\e[32m\]\u@\h \[\033[35m\]$SHELLNAME \[\e[33m\]\W\[\e[0m\]\n\$ "
        ;;
esac


# If starship (fancy shell prompt) is installed, use that instead:
# (only enable starship in interactive mode and PTY, i.e. in a terminal emulator)
if [ -x "$(command -v starship)" ] && [[ $- == *i* ]] && [ "$TELETYPE" == "PTY" ]; then
    # Workaround for Cygwin
    if [ "$SHELLNAME" != "Cygwin" ]; then
        export STARSHIP_CONFIG=~/.config/starship.toml
    fi

    # Enable starship
    function set_win_title(){
        echo -ne "\033]0; $(basename "$PWD") \007"
    }
    starship_precmd_user_func="set_win_title"

    eval "$(starship init bash)"
fi


# If installed, source ble.sh (Bash Line Editor)
# (only in interactive mode)
if [[ $- == *i* ]] && [ -f ~/.local/share/blesh/ble.sh ]; then
    source ~/.local/share/blesh/ble.sh

    # ble.sh options:
    if [ -f ~/.blesh_options.sh ]; then
        source ~/.blesh_options.sh
    fi
fi