# Configure shell prompt depending on system:

export SHELL_PROMPT_CHAR="\$"
case "$(uname -sr)" in
    Linux*)
        if [ "$EUID" -eq 0 ]; then
            export SHELL_PROMPT_CHAR="#"
        fi
        ;;
    CYGWIN*|MINGW*|MINGW32*|MSYS*)
        if [ "$(isadmin)" == "admin" ]; then
            export SHELL_PROMPT_CHAR="#"
        fi
        ;;
esac

PS1="\[\e]0;\W\a\]\n\[\e[32m\]\u@\h \[\033[35m\]$SHELLNAME \[\033[34m\]bash \[\e[33m\]\W\[\e[0m\]\n$SHELL_PROMPT_CHAR "
# PS1="\[\e]0;\u@\h \W\a\]\n\[\e[32m\]\u@\h \[\033[35m\]$SHELLNAME \[\033[34m\]bash \[\e[33m\]\W\[\e[0m\]\n\$ "