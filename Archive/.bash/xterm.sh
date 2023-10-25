#!/bin/bash

# Under Wayland, you may want to use ~/.Xdefaults instead.

# If the file ~/.Xresources exists...
[[ -f ~/.Xresources ]] && \
    # and the command 'xrdb' exists...
    [ -x "$(command -v xrdb)" ] && \
        # and the DISPLAY environment variable is set...
        [ -n "$DISPLAY" ] && \
            # and the session is x11/xorg...
            [ "$XDG_SESSION_TYPE" == "x11" ] && \
                # then (and only then) merge .Xresources
                xrdb -merge ~/.Xresources