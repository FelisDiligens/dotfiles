#!/bin/bash

if [ -x "$(command -v magick)" ] && [ ! -x "$(command -v convert)" ]; then
    alias "convert"="magick convert"
fi

if [ -x "$(command -v convert)" ]; then
    function make-ico {
        if [[ "$1" == *.svg ]]; then
            # "-background transparent":                  Keep transparency instead of making the background white
            # "-size 1024x1024":                          Tell ImageMagick to draw the vector image onto a 1024px wide canvas
            # "-gravity center -extent 1024x1024":        Extend the canvas to a square
            # "-define icon:auto-resize=256,64,48,32,16": ico files have multiple "layers", areas are multiple of 2
            # "${1%.*}.ico":                              replace the last file extension by ".ico"
            convert -background transparent -size 1024x1024 -gravity center -extent 1024x1024 "$1" -define icon:auto-resize=256,64,48,32,16 "${1%.*}.ico"
        else
            convert -background transparent -resize 1024x -gravity center -extent 1024x1024 "$1" -define icon:auto-resize=256,64,48,32,16 "${1%.*}.ico"
        fi
    }
fi