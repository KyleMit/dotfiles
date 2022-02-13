; Ctrl + 5 -> Sen Ctrl + Shift + M
^5::^+M

^4::
Run, pwsh -Command "Stop-ElgatoKeyLight -Host 192.168.1.64", , Hide
Return

^9::
Run, pwsh -Command "Set-ElgatoKeyLight  -Host 192.168.1.64 -On -Brightness 5 -Temperature 4000", , Hide
Return
