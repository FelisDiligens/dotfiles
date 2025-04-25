# Fix no persistent history
# https://superuser.com/questions/1717635/powershell-history-isnt-persistent-anymore
Import-Module PSReadLine

# Oh My Posh
if (Get-Command "oh-my-posh" -ErrorAction SilentlyContinue) {
    $ompTheme = "$env:POSH_THEMES_PATH\powerlevel10k_rainbow.omp.json" # markbull.omp.json, kushal.omp.json
    if (Test-Path -Path "$ompTheme") {
        oh-my-posh init pwsh --config "$ompTheme" | Invoke-Expression
    } else {
        oh-my-posh init pwsh | Invoke-Expression
    }
}

# Zoxide
if (Get-Command "zoxide" -ErrorAction SilentlyContinue) {
    Invoke-Expression (& { (zoxide init powershell | Out-String) })
    Remove-Item alias:cd -ErrorAction SilentlyContinue
    Set-Alias -Name cd -Value z
}

# Ctrl+D to exit, Ctrl+L to clear screen, and more. Like in bash <3
Set-PSReadlineOption -EditMode Emacs

# Move cursor around words with Ctrl <- and ->
Set-PSReadLineKeyHandler -Chord Ctrl+LeftArrow BackwardWord
Set-PSReadLineKeyHandler -Chord Ctrl+RightArrow ForwardWord

# Tab completion like in fish <3
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Remove aliases for Invoke-WebRequest (iwr)
# (use actual GNU Wget / cURL)
Remove-Item alias:curl -ErrorAction SilentlyContinue
Remove-Item alias:wget -ErrorAction SilentlyContinue

# Remove aliases that I want to declare myself:
Remove-Item alias:cd -ErrorAction SilentlyContinue
Remove-Item alias:ls -ErrorAction SilentlyContinue

# Aliases:
Set-Alias -Name g -Value git

function cd ([string]$path = "") {
    if ($path -eq "") {
        # If no argument is given, cd into ~
        Set-Location $HOME
    } elseif (Get-Command "z" -ErrorAction SilentlyContinue) {
        z $path
    } else {
        Set-Location $path
    }
}

# mkdir && cd
function mcd ([string]$Path) {
    New-Item -Path $Path -ItemType Directory
    Set-Location -Path $Path
}

# Unix-like `which` (incomplete)
function which (
    [Parameter(Position=0)]
    [string]$cmd_name,
    [switch]$a = $false
) {
    if ($cmd_name -eq "") {
        Write-Host "Usage: which [-a] COMMAND"
        Write-Host "Find a command: simple wrapper around Get-Command"
        return
    }

    # $original_which = Get-Command "which" -CommandType Application -ErrorAction SilentlyContinue
    # if ($original_which.Count -gt 0) {
    #     $a_switch = If ($a) {"-a"} Else {""}
    #     return Invoke-Expression "$($original_which[0].Path) $a_switch $cmd_name"
    # }

    $cmds = Get-Command -CommandType Application "$cmd_name" -ErrorAction SilentlyContinue
    if ($cmds.Count -eq 0) {
        Write-Host "$cmd_name not found"
    } elseif ($a) {
        foreach ($cmd in $cmds) {
            Write-Host $cmd.Path
        }
    } else {
        Write-Host $cmds[0].Path
    }
}

function elevate () {
    #Start-Process powershell -Verb runAs
    Start-Process wt powershell -Verb runAs
}

# Unix-like `env` (incomplete)
function env () {
    $env_variables = (Get-ChildItem env:* | Sort-Object Name)
    foreach ($var in $env_variables) {
        Write-Host "$($var.Name)=$($var.Value)"
    }
}

# Unix-like `export`
function export ([string]$VariableNameAndValue) {
    if ($VariableNameAndValue -eq "") {
        env
        return
    }
    $splitArray = $VariableNameAndValue.trim().Split("=")
    if ($splitArray.length -ne 2) {
        echo "Usage: export VAR=VAL"
        return
    }
    $VariableName = $splitArray[0].trim()
    $Value = $splitArray[1].trim()
    Set-Item env:$VariableName -Value $Value
}

# Unix-like `touch`
function touch ([string]$path) {
    Write-Host $null >> $path
}

function source([string]$path) {
    . $path
}

function ls ([string]$path) {
    if (Get-Command "eza" -ErrorAction SilentlyContinue) {
        eza --icons "$path"
    } else {
        # https://mikefrobbins.com/2022/05/26/format-the-output-of-a-string-in-multiple-columns-with-powershell/
        Get-ChildItem -Name -Path $path | Format-Wide -Property {$_} -Column 4 -Force
    }
}

function la ([string]$path) {
    if (Get-Command "eza" -ErrorAction SilentlyContinue) {
        eza --icons --all --group-directories-first "$path"
    } else {
        ls "$path"
    }
}

function ll ([string]$path) {
    if (Get-Command "eza" -ErrorAction SilentlyContinue) {
        eza --icons --all --long --header --group-directories-first "$path"
    } else {
        Get-ChildItem -Force -Path $path
    }
}

function tree ([string]$path) {
    if (Get-Command "eza" -ErrorAction SilentlyContinue) {
        eza --icons --tree "$path"
    } else {
        Invoke-Expression "cmd /C tree `"$path`""
    }
}

function IsAdmin {
    $currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        return $true
    }
    return $false
}

# Show prompt like in MSYS2/Cygwin
# function prompt {
#     # Colors
#     # https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences
#     $esc     = [char]27
#     $reset   = "$esc[0m"
#     $red     = "$esc[31m"
#     $green   = "$esc[32m"
#     $yellow  = "$esc[33m"
#     $blue    = "$esc[34m"
#     $magenta = "$esc[35m"

#     # Get current folder name (either ~ or basename)
#     $FolderName = (Get-Item $pwd).Name
#     if ("$(Get-Item $pwd)" -eq "$HOME") {
#         $FolderName = "~"
#     }

#     # Set window title
#     $host.ui.RawUI.WindowTitle = $FolderName

#     # Return formatted prompt
#     return "`n$green$Env:UserName@$(hostname) $($magenta)PowerShell $yellow$FolderName$reset`n" + $(If (IsAdmin) {"$($red)#$reset "} Else {"$ "})
# }