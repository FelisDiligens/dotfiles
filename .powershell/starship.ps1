# Show pwd in window title
function Invoke-Starship-PreCommand {
    if ("$(Get-Item $pwd)" -eq "$HOME") {
        $host.ui.RawUI.WindowTitle = "~"
    } else {
        $host.ui.RawUI.WindowTitle = (Get-Item $pwd).Name
    }
}

# Check if elevated
if ($env:OS -eq "Windows_NT") {
    $currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        $env:STARSHIP_PROMPT_ROOT = " "
    }
}

# Starship
Invoke-Expression (&starship init powershell)