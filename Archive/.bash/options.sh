#!/bin/bash

# History
HISTCONTROL=ignoredups
shopt -s histappend
HISTSIZE=500
HISTFILESIZE=500

# https://askubuntu.com/questions/67283/is-it-possible-to-make-writing-to-bash-history-immediate
# Save history after each command
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize