# If starship (fancy shell prompt) is installed, use that instead:
# (only enable starship when in interactive mode and in a terminal emulator)
if [ -x "$(command -v starship)" ] && [[ $- == *i* ]] && [ "$(tset -q)" == "xterm-256color" ]; then
    # Workaround for Cygwin
    if [ "$(uname -o)" != "Cygwin" ]; then
        export STARSHIP_CONFIG=~/.config/starship.toml
    fi

    # Function for window title:
    function set_win_title(){
        if [ "$PWD" = "$HOME" ]; then
            echo -ne "\033]0; ~ \007"
        else
            echo -ne "\033]0; $(basename "$PWD") \007"
        fi
    }
    starship_precmd_user_func="set_win_title"

    # Enable starship
    eval "$(starship init bash)"

    # Save history after each command
    PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
fi