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