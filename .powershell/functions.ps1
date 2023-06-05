function mcd ([string]$Path) {
    New-Item -Path $Path -ItemType Directory
    Set-Location -Path $Path
}

function which([Parameter(Mandatory)][string]$Name) {
    return (Get-Command $Name).Path
}