# Determine SHELLNAME
switch "$(uname -sr)"
    case "Linux*WSL2*"
        export SHELLNAME="WSL"
    case "Linux*android*"
        export SHELLNAME="Termux";;
    case "Linux*"
        if [ -x "$(command -v lsb_release)" ]
            export SHELLNAME="$(lsb_release -is)"
        else if [ -f "/etc/os-release" ]
            export SHELLNAME="$(cat /etc/os-release | grep -e "^NAME=" | sed 's/NAME=\"\(.*\)\"/\1/')"
        else
            export SHELLNAME="$(uname -o)"
        end
    case "CYGWIN*"
        export SHELLNAME="Cygwin"
    case "MINGW*|MINGW32*|MSYS*"
        export SHELLNAME="MSYS2"
    case "Darwin*"
        export SHELLNAME="macOS"
    case "*"
        export SHELLNAME="$(uname -o)"
end


# Determine SHELL_PROMPT_CHAR
export SHELL_PROMPT_CHAR="\$"
is_root && export SHELL_PROMPT_CHAR="#"