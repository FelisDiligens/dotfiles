#!/bin/sh

# Source everything inside of ~/.dash in alphabetical order that ends with .sh
FILES=$(find "$HOME/.dash" -type f  -name "*.sh" | sort)
for FILE in $FILES; do
    . "$FILE"
done