#!/bin/bash

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

# Source everything inside of ~/.bash in alphabetical order that either starts with .bash_ or ends with .sh
[[ -f "$HOME/.bash/get_source.py" ]] && eval "$( $HOME/.bash/get_source.py )"

#str="$(find $HOME/.bash -maxdepth 1 -type f -regex '^.*/\(\.bash_.+\|.+\.sh\)$' -print | sort)"
#arr=( $str )
#for f in "${arr[@]}"; do
#   [[ -f $f ]] && source $f --source-only || echo "$f not found"
#done