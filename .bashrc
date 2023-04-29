#!/bin/bash

# History
HISTCONTROL=ignoredups
shopt -s histappend
HISTSIZE=500
HISTFILESIZE=500

# https://askubuntu.com/questions/67283/is-it-possible-to-make-writing-to-bash-history-immediate
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Source variables:
[[ -f "$HOME/.bash_variables" ]] && source $HOME/.bash_variables

# Source aliases:
[[ -f "$HOME/.bash_aliases" ]] && source $HOME/.bash_aliases

# Source functions:
[[ -f "$HOME/.bash_functions" ]] && source $HOME/.bash_functions

# Source completions:
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    source /etc/bash_completion
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
TELETYPE_NUMBER=0
if [ -x "$(command -v tty)" ]; then
    if [ "$(uname -s)" == "Linux" ] && ! tty | grep -q "pts"; then
        TELETYPE="TTY"
    fi
    TELETYPE_NUMBER=$(tty | sed s/[^0-9]*//)
fi


# Configure shell prompt depending on system:
case "$(uname -sr)" in
    Linux*WSL2*)
        PS1="\[\e]0;\W\a\]\n\[\e[32m\]\u@\h \[\033[35m\]$SHELLNAME bash \[\e[33m\]\W\[\e[0m\]\n\$ "
        ;;
    CYGWIN*|MINGW*|MINGW32*|MSYS*)
        if [ "$(isadmin)" == "admin" ]; then
            PS1="\[\e]0;\W\a\]\n\[\e[32m\]\u@\h \[\033[35m\]$SHELLNAME bash \[\e[33m\]\W\[\e[0m\]\n# "
        else
            PS1="\[\e]0;\W\a\]\n\[\e[32m\]\u@\h \[\033[35m\]$SHELLNAME bash \[\e[33m\]\W\[\e[0m\]\n\$ "
        fi
        ;;
    *)
        #        Window title                       Command prompt
        #     |----------------|            |-------------------------------|
        PS1="\[\e]0;\u@\h \W\a\]\n\[\e[32m\]\u@\h \[\033[35m\]$SHELLNAME \[\033[34m\]bash \[\e[33m\]\W\[\e[0m\]\n\$ "
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
    PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
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

# Register pipx completions
[[ -x "$(command -v pipx)" ]] && eval "$(register-python-argcomplete pipx)"

# If zoxide is installed, run init
[ -x "$(command -v zoxide)" ] eval "$(zoxide init bash)"