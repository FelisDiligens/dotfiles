function mcd -d "mkdir & chdir"
    set folder $argv[1]
    mkdir -p -- "$folder" && cd "$folder"
end