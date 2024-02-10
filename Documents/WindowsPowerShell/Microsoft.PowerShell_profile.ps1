# Ctrl+D to exit, Ctrl+L to clear screen, and more. Like in bash <3
Set-PSReadlineOption -EditMode Emacs

# Move cursor around words with Ctrl <- and ->
Set-PSReadLineKeyHandler -Chord Ctrl+LeftArrow BackwardWord
Set-PSReadLineKeyHandler -Chord Ctrl+RightArrow ForwardWord

# Tab completion like in fish <3
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

Set-Alias -Name g -Value git

# mkdir && cd
function mcd ([string]$Path) {
    New-Item -Path $Path -ItemType Directory
    Set-Location -Path $Path
}

# Linux-like `which`
function which ([string]$Name) {
    if ($Name -eq "") {
        Write-Host "Usage: which COMMAND"
        Write-Host "Simple wrapper function around Get-Command. Returns the full path of a given command."
    } elseif ((Get-Command $Name -errorAction SilentlyContinue) -and ((Get-Command $Name).CommandType -eq "Application")) {
        return (Get-Command $Name).Path
    } else {
        Write-Host "which: no $Name in ($env:PATH)" -fore red
    }
}

function IsAdmin {
    $currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        return $true
    }
    return $false
}

# Show prompt like in MSYS2/Cygwin
function prompt {
    # Colors
    # https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences
    $esc     = [char]27
    $reset   = "$esc[0m"
    $red     = "$esc[31m"
    $green   = "$esc[32m"
    $yellow  = "$esc[33m"
    $blue    = "$esc[34m"
    $magenta = "$esc[35m"

    # Get current folder name (either ~ or basename)
    $FolderName = (Get-Item $pwd).Name
    if ("$(Get-Item $pwd)" -eq "$HOME") {
        $FolderName = "~"
    }

    # Set window title
    $host.ui.RawUI.WindowTitle = $FolderName

    # Return formatted prompt
    return "`n$green$Env:UserName@$(hostname) $($magenta)PowerShell $yellow$FolderName$reset`n" + $(If (IsAdmin) {"$($red)#$reset "} Else {"$ "})
}