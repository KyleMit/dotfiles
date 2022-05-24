::must runas admin
mklink /h %UserProfile%\.kyle-words.txt .kyle-words.txt
mklink /h %UserProfile%\.bashrc .bashrc
mklink /h %UserProfile%\.stacker.omp.yaml .stacker.omp.yaml

mklink /h %UserProfile%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 profile.ps1
mklink /h %UserProfile%\Documents\WindowsPowerShell\Microsoft.VSCode_profile.ps1 profile.ps1

mklink /h "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\AutoHotkey.ahk" AutoHotkey.ahk

:: exmaple - C:\Users\kmitofsky\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
pushd %LocalAppData%\Packages\
for /f %%i in ('dir /b Microsoft.WindowsTerminal*') do set WinTermPkgName=%%i
popd
mklink /h %LocalAppData%\Packages\%WinTermPkgName%\LocalState\settings.json windows-terminal.json
