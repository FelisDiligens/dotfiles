# Git aliases:
if (Get-Command "git" -ErrorAction SilentlyContinue) {
    function gcl ([string]$url) { git clone "$url" }
    function gs { git status }
    function gd { git diff }
    function ga { git add $args }
    function gall { git add -A }
    Remove-Item alias:gcm -Force -ErrorAction SilentlyContinue
    function gcm ([string]$commitmsg) { git commit -m "$commitmsg" }
    function gac ([string]$commitmsg) {
        git add -A
        git commit -m "$commitmsg"
    }
    Remove-Item alias:gp -Force -ErrorAction SilentlyContinue
    function gp { git push }
    function gl { git pull }
    function gm { git merge }
}

# Use exa
if (Get-Command "exa.exe" -errorAction SilentlyContinue) {
    Set-Alias -Name exa -Value exa.exe
}

if (Get-Command "exa" -errorAction SilentlyContinue) {
    Remove-Item alias:ls -Force -ErrorAction SilentlyContinue
    function ls {
        exa --icons $args
    }

    function ll {
        exa --icons --all --long --header --group-directories-first $args
    }

    function la {
        exa --icons --all --group-directories-first $args
    }

    function l {
        exa --icons --classify $args
    }

    function tree {
        exa --icons --tree $args
    }
} else {
    # No exa?
    
    Remove-Item alias:ls -Force -ErrorAction SilentlyContinue
    function ls {
        Get-ChildItem -Name $args
    }

    function ll {
        Get-ChildItem $args
    }

    function la {
        Get-ChildItem -Force $args | ForEach-Object {
            if ((Get-Item $_.FullName -Force) -is [System.IO.DirectoryInfo]) {
                Write-Host " $($_.Name)"
            } else {
                Write-Host " $($_.Name)"
            }
        }
    }

    function l {
        Get-ChildItem $args | ForEach-Object {
            if ((Get-Item $_.FullName -Force) -is [System.IO.DirectoryInfo]) {
                Write-Host " $($_.Name)"
            } else {
                Write-Host " $($_.Name)"
            }
        }
    }
}

# Zoxide
if (Get-Command "zoxide" -errorAction SilentlyContinue) {
    Invoke-Expression (& {
        $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
        (zoxide init --hook $hook powershell | Out-String)
    })

    # Set-Alias -Name cd -Value z -Option AllScope
}