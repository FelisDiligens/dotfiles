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

# Determine TELETYPE and TELETYPE_NUMBER
TELETYPE="PTY"
TELETYPE_NUMBER=0
if [ -x "$(command -v tty)" ]; then
    if [ "$(uname -s)" == "Linux" ] && ! tty | grep -q "pts"; then
        TELETYPE="TTY"
    fi
    TELETYPE_NUMBER=$(tty | sed s/[^0-9]*//)
fi