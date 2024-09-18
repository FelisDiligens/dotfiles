#!/bin/sh

# Add to .bashrc / .zshrc:
# [ -f "$HOME/.profile" ] && source "$HOME/.profile"

[ -d "${HOME}/.local/bin" ] && export PATH="${PATH}:${HOME}/.local/bin"
[ -d "${HOME}/go/bin" ] && export PATH="$PATH:${HOME}/go/bin"
[ -d "${HOME}/.npm-global/bin" ] && export PATH="$PATH:${HOME}/.npm-global/bin"
[ -d "${HOME}/.gem/bin" ] && export PATH="$PATH:${HOME}/.gem/bin"

export EDITOR=vi
[ -x "$(command -v vim)" ] && export EDITOR=vim
[ -x "$(command -v meld)" ] && export DIFFPROG=meld

[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"