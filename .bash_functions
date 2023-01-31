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

	# eval $cmd &>/dev/null &
	# eval $cmd >/dev/null 2>&1 &
	# nohup $cmd &

	# https://www.reddit.com/r/bash/comments/sh80cm/better_way_to_suppress_ampersand_output/
	# It works, but looks disgusting, lol:
	$(eval $cmd &>/dev/null &) &>/dev/null
}

# Sadly, doesn't work
#function bash-reload {
#    # https://stackoverflow.com/questions/2518127/how-to-reload-bashrc-settings-without-logging-out-and-back-in-again
#    history -a && exec env -i HOME="$HOME" "$BASH" -l
#}

case "$(uname -sr)" in
    Linux*WSL2*)
		function wcd ()
		{
			# Requires wslpath and php: https://github.com/laurent22/wslpath
			if [ -d "$1" ]; then
				cd "$1"
			else
				cd $(wslpath -u "$1")
			fi
		}
	;;
	CYGWIN*)
		function wcd ()
		{
		    cd $(cygpath -u "$1")
		}
	;;
esac

if [ "${OSTYPE}" == "cygwin" ] || [ "${OSTYPE}" == "msys" ]; then
	# Bash on Windows: Check admin rights
	# Source: https://superuser.com/questions/660191/how-to-check-if-cygwin-mintty-bash-is-run-as-administrator
	function isadmin()
	{
		net session > /dev/null 2>&1
		if [ $? -eq 0 ]; then echo "admin"
		else echo "user"; fi
	}
fi