#!/bin/bash

# Source completions:
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    source /etc/bash_completion
fi

# Source everything inside of ~/.dash in alphabetical order that ends with .sh
FILES=$(find "$HOME/.dash" -type f  -name "*.sh" | sort)
for FILE in $FILES; do
    source "$FILE"
done

# Source everything inside of ~/.bash in alphabetical order that ends with .sh
FILES=$(find "$HOME/.bash" -type f  -name "*.sh" | sort)
for FILE in $FILES; do
    source "$FILE"
done