# Setup
# Install-Module PSReadLine -AllowPrerelease -Force
# code $PROFILE

# in profile.ps1
if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

oh-my-posh init pwsh --config $env:USERPROFILE\.stacker.omp.yaml | Invoke-Expression
