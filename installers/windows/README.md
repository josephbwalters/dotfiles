# Windows
This isn't scripted yet, however the intent of this installer is to setup windows with some sane defaults and software I use daily.

Non-comprehensive list of software this will install:
- Chocolatey
- Python3 (3.9.6)
- VSCode
- Git Bash
- Github Desktop (optional)
- git
- brave
- discord
- steam
- obs
- gimp
- googledrive
- ... more in script!

# Prerequisite Software (Manual)
## Chocolatey
See [Chocolatey Installer](https://chocolatey.org/install) and [Chocolatey Packages](https://community.chocolatey.org/packages)\
If you want a GUI instead of CLI you can install [Chocolatey GUI](https://docs.chocolatey.org/en-us/chocolatey-gui/setup/installation)

# Installing Software
```bash
# Package managers
choco feature enable -n allowGlobalConfirmation
choco install chocolateygui

# Development
choco install vscode
choco install github-desktop
choco install pyenv-win
choco install docker-desktop
choco install git
choco install microsoft-windows-terminal
choco install nvm
choco install yarn

# Databases
choco install postgresql
choco install pgadmin4

# Diagramming
choco install visualparadigm-ce
# Lucidchart

# Browser
choco install brave

# Comms
choco install discord
choco install slack
choco install zoom

# Games
choco install steam-client
choco install osu
choco install origin
choco install epicgameslauncher

# Content Creation
choco install spotify
choco install obs-studio
choco install gimp
choco install vlc

# Cloud Storage
choco install googledrive
choco install dropbox

# Documents
# I use google so N/A

# Fonts
choco install firacode

# Other
choco install 7zip

```