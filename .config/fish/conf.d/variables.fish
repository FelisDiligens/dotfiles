# Determine SHELLNAME
switch "(uname -sr)"
    case "Linux*WSL2*"
        export SHELLNAME="WSL"
    case "Linux*android*"
        export SHELLNAME="Termux";;
    case "Linux*"
        if [ -x "(command -v lsb_release)" ]
            export SHELLNAME=(lsb_release -is)
        else
            export SHELLNAME=(uname -o)
        end
    case "CYGWIN*"
        export SHELLNAME="Cygwin"
    case "MINGW*|MINGW32*|MSYS*"
        export SHELLNAME="MSYS2"
    case "*"
        export SHELLNAME=(uname -o)
end


# Determine TELETYPE and TELETYPE_NUMBER
set TELETYPE "PTY"
if command -sq tty
    if [ "(uname -s)" = "Linux" ] && ! tty | grep -q "pts"
        set TELETYPE "TTY"
    end
    set TELETYPE_NUMBER (tty | sed "s/[^0-9]*//")
end