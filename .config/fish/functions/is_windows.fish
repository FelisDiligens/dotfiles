function is_windows
    return ([ "$SHELLNAME" = "Cygwin" ] || [ "$SHELLNAME" = "MSYS2" ])
end