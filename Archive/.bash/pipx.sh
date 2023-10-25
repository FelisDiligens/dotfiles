# Register pipx completions
[[ -x "$(command -v pipx)" ]] && [[ "$(uname -o)" != "Cygwin" ]] && eval "$(register-python-argcomplete pipx)"