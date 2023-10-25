#!/bin/sh

# Configure shell prompt depending on system:

# Determine SHELLNAME
case "$(uname -sr)" in
    Linux*WSL2*) export SHELLNAME="WSL";;
    Linux*android*) export SHELLNAME="Termux";;
    Linux*)
        if [ -x "$(command -v lsb_release)" ]; then
            export SHELLNAME="$(lsb_release -is)"
        elif [ -f "/etc/os-release" ]; then
            export SHELLNAME="$(grep -e "^NAME=" "/etc/os-release" | sed 's/NAME=\"\(.*\)\"/\1/')"
        else
            export SHELLNAME="$(uname -o)"
        fi
        ;;
    CYGWIN*) export SHELLNAME="Cygwin";;
    MINGW*|MSYS*) export SHELLNAME="MSYS2";;
    Darwin*) export SHELLNAME="macOS";;
    *) export SHELLNAME="$(uname -o)";;
esac

# Use '$' for normal user and '#' for root/admin:
export SHELL_PROMPT_CHAR="\$"
case "$(uname -sr)" in
    Linux*)
        # Are we root?
        if [ "$(id -u)" -eq 0 ]; then
            export SHELL_PROMPT_CHAR="#"
        fi
        ;;
    CYGWIN*|MINGW*|MSYS*)
        # Are we admin?
        if net session > /dev/null 2>&1; then
            export SHELL_PROMPT_CHAR="#"
        fi
        ;;
esac

PS1="\[\e]0;\W\a\]\n\[\e[32m\]\u@\h \[\033[35m\]$SHELLNAME \[\033[34m\]$0 \[\e[33m\]\W\[\e[0m\]\n$SHELL_PROMPT_CHAR "
# PS1="\[\e]0;\u@\h \W\a\]\n\[\e[32m\]\u@\h \[\033[35m\]$SHELLNAME \[\033[34m\]bash \[\e[33m\]\W\[\e[0m\]\n\$ "