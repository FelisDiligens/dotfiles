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
    if ($(whoami) -eq "root") {
        $env:SHELL_PROMPT_CHAR = "#"
        [bool] $ISADMIN = $true
    }
    $SHELLNAME = "Linux"
} elseif ($IsMacOS) {
    $SHELLNAME = "macOS"
}

function prompt {
    $esc = [char]27
    $reset = "$esc[0m"
    $green = "$esc[32m"
    $yellow = "$esc[33m"
    $blue = "$esc[34m"
    $magenta = "$esc[35m"

    $FolderName = (Get-Item $pwd).Name
    if ("$(Get-Item $pwd)" -eq "$HOME") {
        $FolderName = "~"
    }
    $host.ui.RawUI.WindowTitle = $FolderName
    return "`n$green$Env:UserName@$Env:ComputerName $magenta$SHELLNAME $($blue)pwsh $yellow$FolderName$reset`n" + $env:SHELL_PROMPT_CHAR # $(If ($ISADMIN) {"# "} Else {"$ "})
}

# Show pwd in window title
function Invoke-Starship-PreCommand {
    if ("$(Get-Item $pwd)" -eq "$HOME") {
        $host.ui.RawUI.WindowTitle = "~"
    } else {
        $host.ui.RawUI.WindowTitle = (Get-Item $pwd).Name
    }
}

# Starship
if (Get-Command "starship" -errorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)
}