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

# Source all scripts under ~\.powershell, except the current one (profile.ps1)
Get-ChildItem -Path "$HOME\.powershell\" -Filter *.ps1 | Sort-Object | ForEach-Object {
    if ($_.FullName -ne $PSCommandPath) {
        . $_.FullName
    }
}