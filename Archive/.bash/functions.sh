#!/bin/bash

# mkdir & chdir:
# Source: https://unix.stackexchange.com/a/125386
mcd()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}

# This function emulates the "START" command found in Windows' CMD.exe:
start() {
    local cmd=""
    while (( $# > 0 )); do
        cmd="$cmd $1"
        shift
    done
    
    $(eval "nohup $cmd" &>/dev/null &) &>/dev/null
}

case "$(uname -sr)" in
    Linux*WSL2*)
        wcd()
        {
            if [ -d "$1" ]; then
                cd "$1"
            else
                cd $(wslpath -u "$1")
            fi
        }
    ;;
    CYGWIN*|MINGW*|MSYS*)
        wcd()
        {
            cd $(cygpath -u "$1")
        }
    ;;
esac