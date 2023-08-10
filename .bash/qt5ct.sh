#!/bin/bash

# If qt5ct is installed...
if [ -x "$(command -v qt5ct)" ] && \
   # and the PLATFORMTHEME option is unset...
   [ -z "$QT_QPA_PLATFORMTHEME" ] && \
   # and we're currently running GNOME...
   { [ "$XDG_CURRENT_DESKTOP" == "ubuntu:GNOME" ] || [ "$XDG_CURRENT_DESKTOP" == "GNOME" ]; }
then
    # then enable qt5ct
    export QT_QPA_PLATFORMTHEME=qt5ct
fi