function mcd ([string]$Path) {
    New-Item -Path $Path -ItemType Directory
    Set-Location -Path $Path
}