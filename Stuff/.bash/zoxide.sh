#!/bin/bash

# If zoxide is installed, run init
[[ -x "$(command -v zoxide)" ]] && eval "$(zoxide init bash)"