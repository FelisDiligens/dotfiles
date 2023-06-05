$env:SHELL_PROMPT_CHAR = "$"
[bool] $ISADMIN = $false
if ($IsWindows -or ($env:OS -eq "Windows_NT")) {
    # Check if elevated
    $currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        $env:SHELL_PROMPT_CHAR = "#"
        [bool] $ISADMIN = $true
    }
    $SHELLNAME = "Windows"
} elseif ($IsLinux) {
    # Check if root
    if ($(whoami) -eq "root") {
        $env:SHELL_PROMPT_CHAR = "#"
        [bool] $ISADMIN = $true
    }
    # Determine linux distro name
    $SHELLNAME = "Linux"
    if (Get-Command "lsb_release" -ErrorAction SilentlyContinue) {
        $SHELLNAME = "$(lsb_release -is)"
    } elseif (Test-Path "/etc/os-release") {
        $SHELLNAME = "$(cat /etc/os-release | grep -e "^NAME=" | sed 's/NAME=\"\(.*\)\"/\1/')"
    } else {
        $SHELLNAME = "$(uname -o)"
    }
} elseif ($IsMacOS) {
    $SHELLNAME = "macOS"
    $env:SHELL_PROMPT_CHAR = "%"
}

function prompt {
    # Colors
    $esc     = [char]27
    $reset   = "$esc[0m"
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
    return "`n$green$Env:UserName@$Env:ComputerName $magenta$SHELLNAME $($blue)pwsh $yellow$FolderName$reset`n" + $env:SHELL_PROMPT_CHAR # $(If ($ISADMIN) {"# "} Else {"$ "})
}

# Show pwd in window title when using starship
function Invoke-Starship-PreCommand {
    if ("$(Get-Item $pwd)" -eq "$HOME") {
        $host.ui.RawUI.WindowTitle = "~"
    } else {
        $host.ui.RawUI.WindowTitle = (Get-Item $pwd).Name
    }
}

# Use Starship if installed
if (Get-Command "starship" -errorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)
}