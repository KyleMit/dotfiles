# Setup
# Install-Module PSReadLine -AllowPrerelease -Force
# code $PROFILE

# in profile.ps1
# if ($host.Name -eq 'ConsoleHost')
# {
#     Import-Module PSReadLine
# }
# Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
# Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

oh-my-posh init pwsh --config $env:USERPROFILE\.stacker.omp.yaml | Invoke-Expression


function cdso() {
    Set-Location -Path C:\code\StackOverflow
}

function dls() {
    Push-Location C:/code/DevLocalSetup
    git pull
    ./setup.bat
    Pop-Location
}

function migrate() {
    $cwd=Get-Location
    Set-Location C:/code/StackOverflow
    git pull

    Set-Location C:/code/StackOverflow/StackOverflow.Migrations
    ./migrate.local.bat # --force

    Set-Location C:/code/StackOverflow/Migrations
    ./migrate.local.channels.bat # --force

    Set-Location C:/code/StackOverflow/Sites.Migrations
    ./migrate.local.bat # --force

    Set-Location $cwd

}

function Start-IISAppPools {
    # TODO elevate permissions
    if (!(Get-Module | Where-Object {$_.Name -eq 'IISAdministration'})) {
        Import-Module IISAdministration
    }

    # TODO - need to elevate to do this...?
    Get-IISAppPool | Where-Object { $_.State -eq 'Stopped' } | ForEach-Object { $_.Start() }
}

function touch {
    Param(
        [Parameter(Mandatory=$true)]
        [string]$Path
    )

    if (Test-Path -LiteralPath $Path) {
        (Get-Item -Path $Path).LastWriteTime = Get-Date
    } else {
        New-Item -Type File -Path $Path
    }
}
