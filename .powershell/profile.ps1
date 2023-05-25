# Put this into $PROFILE:
# if (Test-Path "$HOME\.powershell\profile.ps1") {
#     . "$HOME\.powershell\profile.ps1"
# }

# Ctrl+D to exit, Ctrl+L to clear screen, and more. Like in bash <3
Set-PSReadlineOption -EditMode Emacs

# Tab completion like in fish <3
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Predictions like in fish, automatically enabled in PSReadline 2.2.6
# Set-PSReadLineOption -PredictionSource HistoryAndPlugin  # PowerShell Core
# Set-PSReadLineOption -PredictionSource History           # Windows PowerShell 5.1

# Source scripts
. "$HOME\.powershell\aliases.ps1"
. "$HOME\.powershell\functions.ps1"
. "$HOME\.powershell\prompt.ps1"

# gsudo (choco install gsudo)
if (Test-Path "C:\tools\gsudo\Current\gsudoModule.psd1") {
    Import-Module "C:\tools\gsudo\Current\gsudoModule.psd1"
}