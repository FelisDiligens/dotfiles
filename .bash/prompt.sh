# Configure shell prompt depending on system:

# Determine SHELLNAME
case "$(uname -sr)" in
    Linux*WSL2*) export SHELLNAME="WSL";;
    Linux*android*) export SHELLNAME="Termux";;
    Linux*)
        if [ -x "$(command -v lsb_release)" ]; then
            export SHELLNAME="$(lsb_release -is)"
        elif [ -f "/etc/os-release" ]; then
            export SHELLNAME="$(cat /etc/os-release | grep -e "^NAME=" | sed 's/NAME=\"\(.*\)\"/\1/')"
        else
            export SHELLNAME="$(uname -o)"
        fi
        ;;
    CYGWIN*) export SHELLNAME="Cygwin";;
    MINGW*|MINGW32*|MSYS*) export SHELLNAME="MSYS2";;
    *) export SHELLNAME="$(uname -o)";;
esac

# Use '$' for normal user and '#' for root/admin:
export SHELL_PROMPT_CHAR="\$"
case "$(uname -sr)" in
    Linux*)
        # Are we root?
        if [ "$EUID" -eq 0 ]; then
            export SHELL_PROMPT_CHAR="#"
        fi
        ;;
    CYGWIN*|MINGW*|MINGW32*|MSYS*)
        # Are we admin?
        net session > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            export SHELL_PROMPT_CHAR="#"
        fi
        ;;
esac

PS1="\[\e]0;\W\a\]\n\[\e[32m\]\u@\h \[\033[35m\]$SHELLNAME \[\033[34m\]bash \[\e[33m\]\W\[\e[0m\]\n$SHELL_PROMPT_CHAR "
# PS1="\[\e]0;\u@\h \W\a\]\n\[\e[32m\]\u@\h \[\033[35m\]$SHELLNAME \[\033[34m\]bash \[\e[33m\]\W\[\e[0m\]\n\$ "