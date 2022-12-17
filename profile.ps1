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

function so-build {

    $buildTimer = [Diagnostics.Stopwatch]::StartNew()
    dotnet build C:\code\StackOverflow\StackOverflow.sln
    $buildTimer.Stop()
    # Start-IISAppPools # requires admin

    # ping site
    $pingTimer = [Diagnostics.Stopwatch]::StartNew()
    $statusCode = Invoke-WebRequest "https://meta.stackexchange.local/" | Select-Object -ExpandProperty StatusCode
    $pingTimer.Stop()

    # ping user
    # Install-Module -Name BurntToast
    New-BurntToastNotification `
        -AppLogo "C:\Users\kmitofsky\Pictures\windows\stack.png" `
        -Text "Build completed", "Build: $([Math]::Floor($buildTimer.Elapsed.TotalSeconds))s Ping: $([Math]::Floor($pingTimer.Elapsed.TotalSeconds))s Status: $status"
}

function so-test-migrate {
    # https://stackoverflowteams.com/c/stack-overflow/a/6046/675
    dotnet run --project C:\code\StackOverflow\utils\StackOverflow.Setup\StackOverflow.Setup.csproj -- network remove PublicTest
    dotnet run --project C:\code\StackOverflow\utils\StackOverflow.Setup\StackOverflow.Setup.csproj -- network new PublicTest
}

function so-test-integration {
    Param(
        [Parameter(Mandatory=$true)]
        [string]$testName
    )
    dotnet test C:\code\StackOverflow\tests\StackOverflow.Tests.Integration\StackOverflow.Tests.Integration.csproj --filter DisplayName~$testName
}
