# either
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module PSReadLine -AllowPrerelease -Force

code $PROFILE

# in profile.ps1
if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Get-PoshThemes
Set-PoshPrompt -Theme Pure
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme Paradox
