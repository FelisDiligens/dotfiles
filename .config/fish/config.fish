if status is-interactive
    # Commands to run in interactive sessions can go here

    # Enable starship
    if command -sq starship && [ "$TELETYPE" = "PTY" ]
        starship init fish | source
    end

    # Enable zoxide
    if command -sq zoxide
        zoxide init fish | source
    end
end
