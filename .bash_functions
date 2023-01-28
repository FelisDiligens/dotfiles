#!/bin/bash

# mkdir & chdir:
# Source: https://unix.stackexchange.com/a/125386
mcd ()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}


# This function emulates the "START" command found in Windows' CMD.exe:
function start {
	local cmd=""
	while (( $# > 0 )); do
		cmd="$cmd $1"
		shift
	done
	eval $cmd &>/dev/null &
}

# Sadly, doesn't work
#function bash-reload {
#    # https://stackoverflow.com/questions/2518127/how-to-reload-bashrc-settings-without-logging-out-and-back-in-again
#    history -a && exec env -i HOME="$HOME" "$BASH" -l
#}
