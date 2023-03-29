function is_root
    if is_windows
        return $(net session > /dev/null 2>&1)
    else
        return $(fish_is_root_user)
    end
end