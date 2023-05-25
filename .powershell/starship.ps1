# Show pwd in window title
function Invoke-Starship-PreCommand {
    if ("$(Get-Item $pwd)" -eq "$HOME") {
        $host.ui.RawUI.WindowTitle = "~"
    } else {
        $host.ui.RawUI.WindowTitle = (Get-Item $pwd).Name
    }
}

# Starship
Invoke-Expression (&starship init powershell)