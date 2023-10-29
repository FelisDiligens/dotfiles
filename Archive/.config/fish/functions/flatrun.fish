# Runs first match
function flatrun
    flatpak run (flatlist | grep -i -F -m 1 $argv[1])
end