#!/bin/bash

# ble.sh options (https://github.com/akinomyoga/ble.sh)

# Disable EOF marker like "[ble: EOF]"
bleopt prompt_eol_mark=''

# Disable error exit marker like "[ble: exit %d]"
bleopt exec_errexit_mark=

# Disable elapsed-time marker like "[ble: elapsed 1.203s (CPU 0.4%)]"
bleopt exec_elapsed_mark=

# Set fonts to my liking
ble-face -s auto_complete      "fg=gray"           # Auto completed text after the cursor
ble-face -s syntax_error       "fg=red"            # Syntax error, e.g. unrecognized command
ble-face -s command_builtin    "fg=purple"         # Builtin command, such as 'echo'
ble-face -s command_file       "fg=blue"           # External command, such as 'git'
ble-face -s filename_directory "underline,fg=cyan" # A directory, e.g. 'cd ~'