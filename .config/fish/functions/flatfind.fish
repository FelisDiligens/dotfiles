# Greps matching application identifier
function flatfind
    flatlist | grep -i -F $argv[1]
end