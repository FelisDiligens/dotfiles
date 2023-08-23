# Enable color by default:
alias ls='ls --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias md='mkdir'
alias rd='rmdir'


# Typical aliases:
alias ll='ls -alFh --group-directories-first'
alias la='ls -A --group-directories-first'
alias l='ls -CF'

alias xo='xdg-open'

# exa (https://github.com/ogham/exa)
if command -sq exa
    alias ls='exa --icons'
    alias la='exa --icons --all --group-directories-first'
    alias ll='exa --icons --all --long --header --group-directories-first'
    alias l='exa --classify --icons'
    alias tree='exa --icons --tree'
end


# Miscellaneous aliases:
if command -sq vim; alias vi=vim; end
if command -sq neowofetch; alias neofetch=neowofetch; end
if command -sq python3; alias python=python3; end

# Colored "cat"
if command -sq pygmentize; alias ccat='pygmentize -g'; end # -O linenos=1
if command -sq highlight; alias ccat='highlight -O ansi'; end
if command -sq batcat; alias bat=batcat; end # batcat -> bat (https://github.com/sharkdp/bat)


# Git aliases:
if command -sq git
    alias g="git"
end

# Package managers:
if command -sq flatpak; alias flat=flatpak; end
if command -sq zypper; alias zyp=zypper; end
if command -sq pacman; alias pac=pacman; end
if command -sq apt-yay; alias ay=apt-yay; end

# "Fixing" npm
if command -sq npm && command -sq node
    alias npm="node --dns-result-order=ipv4first $(which npm)"
end

# snap packages
if command -sq snap
    alias lsblk="lsblk -e 7"
    if snap list | grep -q -E "clipboard.*bachatero"
        alias cb="snap run clipboard"
    end
end

# Flatpak packages
if command -sq flatpak
    if flatpak list --columns=application | grep -q "org.wezfurlong.wezterm"
        alias wezterm="flatpak run org.wezfurlong.wezterm"
    end
end


switch "(uname -sr)"
    # WSL specific:
    case "Linux*WSL2*"
        if command -sq "wslview"
            alias xdg-open="wslview"
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
