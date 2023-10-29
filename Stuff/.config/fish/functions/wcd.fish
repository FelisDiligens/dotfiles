function wcd -d "cd to Windows path"
    set folder $argv[1]
    if command -sq cygpath
        cd (cygpath $folder)
    else if command -sq wslpath
        cd (wslpath $folder)
    else
        cd $folder
    end
end