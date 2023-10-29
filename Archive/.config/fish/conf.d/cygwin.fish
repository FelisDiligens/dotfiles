# Cygwin workarounds
if is_windows # string match -q -- "CYGWIN*" "$(uname -sr)"
    # gsudo
    if command -sq gsudo and 
        alias sudo=gsudo
    end
end