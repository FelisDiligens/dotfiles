function start
    #set cmd ""
    #for i in (seq 1 (count $argv))
    #    set cmd "$cmd $argv[$i]"
    #end
    #eval $cmd &>/dev/null &

    # https://github.com/fish-shell/fish-shell/issues/238#issuecomment-1015806466
    fish -c (string join -- ' ' (string escape -- $argv)) &
end