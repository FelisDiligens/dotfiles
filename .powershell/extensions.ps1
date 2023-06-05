# gsudo (choco install gsudo)
if (Test-Path "C:\tools\gsudo\Current\gsudoModule.psd1") {
    Import-Module "C:\tools\gsudo\Current\gsudoModule.psd1"
}

# Zoxide
if (Get-Command "zoxide" -errorAction SilentlyContinue) {
    Invoke-Expression (& {
        $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
        (zoxide init --hook $hook powershell | Out-String)
    })
}