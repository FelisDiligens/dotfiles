#!/bin/sh

# For 'sudoedit':
[ -x "$(command -v vim)" ] && export EDITOR="vim" && export VISUAL="vim"

[ -x "$(command -v meld)" ] && export DIFFPROG="meld"

# ~/.local/bin
[ -d "$HOME/.local/bin" ] && export PATH=$PATH:$HOME/.local/bin

# ~/go/bin
[ -d "$HOME/go/bin" ] && export PATH=$PATH:$HOME/go/bin

# npm
[ -d "$HOME/.npm-global/bin" ] && export PATH=$PATH:$HOME/.npm-global/bin

# Android SDK
if [ -d "$HOME/Android/Sdk" ]; then
    export ANDROID_SDK_ROOT=$HOME/Android/Sdk
    export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
    export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin
    export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
    # export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
    # export PATH=$PATH:$ANDROID_SDK_ROOT/build-tools/30.0.3
fi

# Cargo (Rust)
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Ruby Gems
# https://stackoverflow.com/a/51012973
export GEM_HOME="$HOME/.gem"
[ -d "$HOME/.gem/bin" ] && export PATH=$PATH:$HOME/.gem/bin
