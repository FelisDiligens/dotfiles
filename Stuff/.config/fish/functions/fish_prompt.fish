function fish_prompt
    set -l prompt_symbol '$'
    is_root; and set prompt_symbol '#'

    echo -s \n (set_color green) $USER@(prompt_hostname) " " \
    (set_color purple) $SHELLNAME " "  \
    (set_color blue) "fish "  \
    (set_color yellow) (prompt_pwd) \n\
    (set_color normal) $prompt_symbol " "
end