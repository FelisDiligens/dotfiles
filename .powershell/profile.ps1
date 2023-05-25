# Put this into $PROFILE:
# if (Test-Path "$HOME\.powershell\profile.ps1") {
#     . "$HOME\.powershell\profile.ps1"
# }

# Ctrl+D to exit, Ctrl+L to clear screen, and more
Set-PSReadlineOption -EditMode Emacs

# Source scripts
. "$HOME\.powershell\aliases.ps1"
. "$HOME\.powershell\functions.ps1"
. "$HOME\.powershell\starship.ps1"

# gsudo (choco install gsudo)
if (Test-Path "C:\tools\gsudo\Current\gsudoModule.psd1") {
    Import-Module "C:\tools\gsudo\Current\gsudoModule.psd1"
}