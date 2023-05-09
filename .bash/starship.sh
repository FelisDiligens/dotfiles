# If starship (fancy shell prompt) is installed, use that instead:
# (only enable starship in interactive mode and PTY, i.e. in a terminal emulator)
if [ -x "$(command -v starship)" ] && [[ $- == *i* ]] && [ "$TELETYPE" == "PTY" ]; then
    # Workaround for Cygwin
    if [ "$SHELLNAME" != "Cygwin" ]; then
        export STARSHIP_CONFIG=~/.config/starship.toml
    fi

    # Enable starship
    function set_win_title(){
        echo -ne "\033]0; $(basename "$PWD") \007"
    }
    starship_precmd_user_func="set_win_title"

    eval "$(starship init bash)"
    PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
fi