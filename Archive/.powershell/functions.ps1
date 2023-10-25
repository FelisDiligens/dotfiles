function mcd ([string]$Path) {
    New-Item -Path $Path -ItemType Directory
    Set-Location -Path $Path
}

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