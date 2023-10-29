function is_windows
    string match -i -r "CYGWIN*|MINGW*|MINGW32*|MSYS*" "$(uname -sr)" >/dev/null
    return $status
end