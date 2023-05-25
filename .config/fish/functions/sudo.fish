# Requires `sudo` from https://github.com/lukesampson/psutils
# Install using: `scoop install sudo`
function sudo -d "Sudo for Windows"
    if ! is_windows
        sudo $argv
    else if count $argv > /dev/null
        switch $argv[1];
            case -h;
                echo "Sudo for Windows. Requires psutils! Supports '-i' argument."
                return
            case -i;
                bash -c "sudo fish"
                return
            case "*";
                bash -c "sudo $argv"
                return
        end
    else
        echo "You cannot run sudo without an argument."
    end
end