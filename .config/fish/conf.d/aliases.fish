# Enable color by default:
alias ls='ls --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# Typical aliases:
alias ll='ls -alFh --group-directories-first'
alias la='ls -A --group-directories-first'
alias l='ls -CF'

# exa (https://github.com/ogham/exa)
if command -sq exa
    alias ls='exa --icons'
    alias la='exa --icons --all --group-directories-first'
    alias ll='exa --icons --all --long --header --group-directories-first'
    alias l='exa --classify --icons'
    alias tree='exa --icons --tree'
end

alias md='mkdir'
alias rd='rmdir'


# Miscellaneous aliases:
if command -sq vim
    alias vi=vim
end


# Colored "cat"
if command -sq pygmentize
    alias ccat='pygmentize -g' # -O linenos=1
end

# Another alternative
if command -sq highlight
    alias ccat='highlight -O ansi'
end

# batcat -> bat (https://github.com/sharkdp/bat)
if command -sq batcat
    alias bat=batcat
end


# Git aliases:
if command -sq git
    alias gcl="git clone"
    alias gs="git status"
    alias gd="git diff"
    alias ga="git add"
    alias gall="git add -A"
    alias gcm="git commit -m"
    alias gac="git add -A && git commit -m" # + commit message
    alias gp="git push"
    alias gl="git pull"
    alias gm="git merge"
end


switch "$(uname -sr)"
    # WSL specific:
    case "Linux*WSL2*"
        if command -sq "wsl-open"
            alias xdg-open="wsl-open"
        end
    # Cygwin/MSYS specific:
    case "CYGWIN*" "MINGW*" "MSYS*"
        if command -sq "apt-cyg"
            alias apt="apt-cyg"
        end
        
        alias xdg-open="explorer"
        alias psh="powershell"
end


# Windows aliases:
alias cls="clear"
alias copy="cp"
alias move="mv"
alias ren='mv'
alias del="rm"
alias chdir="cd"