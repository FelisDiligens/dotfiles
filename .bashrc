#!/bin/bash

# Source completions:
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    source /etc/bash_completion
fi

# Source everything inside of ~/.bash in alphabetical order that either starts with .bash_ or ends with .sh
FILES=$(find "$HOME/.bash" -type f  \( -name ".bash*" -o -name "*.sh" \) | sort)
for FILE in $FILES; do
    source "$FILE"
done