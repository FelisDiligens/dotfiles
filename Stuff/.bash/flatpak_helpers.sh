#!/bin/bash

# Flatpak helpers

if [ -x "$(command -v flatpak)" ]; then

    # Lists all application identifiers
    flatlist() {
        # I realized way too late, that you can simply declare which columns you want instead of using regex, lol
        #flatpak list | perl -p -e "s/^[^\t]+\t([^\t]+)\t.*\$/\1/g"
        flatpak list --columns=application
    }

    # Greps matching application identifier
    flatfind() {
        flatlist | grep -i -F "$1"
    }

    # Runs first match
    # (I'm way too lazy to enter the entire identifier!)
    flatrun() {
        flatpak run "$(flatlist | grep -i -F -m 1 "$1")"
    }

fi