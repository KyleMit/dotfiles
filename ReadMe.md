# Collection of DotFiles / Configs / Settings


## TODO

* Explore Bare Directory / SymLink across folders
* Sunset [gists/cloudSettings](https://gist.github.com/KyleMit/9e22c8ecf6d7f5504edbfffe6dce6dcf)
* Combine with [winstall](https://github.com/KyleMit/winstall)
* Update Windows Terminal
* Combine gitconfig
* Sync Bash History?
* Ensure Runas Admin
* Check for existing file and ensure it's hardlinked
  > Cannot create a file when that file already exists.
* Check for Pre-Reqs
  * oh-my-posh
  * nerdfonts
  * autohotkey
    * elg
* Multi-OS Support?
* Turn off App Execution Aliases

## Icons

Available via [Nerd Fonts](https://www.nerdfonts.com/)

*  - `\uf16c`
* ⇡ - `\u21e1`
* ⇣ - `\u21e3`
* 祥 - `\ufa1a`
* ❯ - `\u276f`
*  - `\uF0E7`


## Setup

```bash
winget install --id=JanDeDobbeleer.OhMyPosh  -e
Invoke-WebRequest get.scoop.sh | Invoke-Expression
scoop bucket add nerd-fonts
scoop install FiraCode-NF
scoop install FiraCode-NF-Mono
setup.bat
```

