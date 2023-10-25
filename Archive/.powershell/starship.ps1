# Use Starship if installed
if (Get-Command "starship" -errorAction SilentlyContinue) {
    # Show pwd in window title when using starship
    function Invoke-Starship-PreCommand {
        if ("$(Get-Item $pwd)" -eq "$HOME") {
            $host.ui.RawUI.WindowTitle = "~"
        } else {
            $host.ui.RawUI.WindowTitle = (Get-Item $pwd).Name
        }
    }
    
    # Init starship
    Invoke-Expression (&starship init powershell)
}