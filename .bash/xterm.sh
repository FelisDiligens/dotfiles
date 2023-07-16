#!/bin/bash

[[ -f ~/.Xresources ]] && [ -x "$(command -v xrdb)" ] && xrdb -merge ~/.Xresources