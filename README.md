# dotfiles

## Setup

macOS or Linux (Debian/Ubuntu, Arch/CachyOS): clone this repo, then run
the one bootstrap script.

```sh
git clone git@gitlab.com:josephbwalters/dotfiles.git ~/Development/dotfiles
cd ~/Development/dotfiles
./bootstrap.sh
```

`bootstrap.sh` auto-detects the OS/distro and, idempotently:
1. Installs Homebrew (+ build prerequisites on Linux) and everything in
   [`bootstrap/Brewfile.mac`](bootstrap/Brewfile.mac) or
   [`bootstrap/Brewfile.linux`](bootstrap/Brewfile.linux) (each includes the
   shared [`bootstrap/Brewfile.common`](bootstrap/Brewfile.common) via
   `eval File.read(...)`, since a Brewfile is just Ruby and Homebrew Bundle
   has no native include directive).
2. Installs Node/Ruby/Python via [mise](https://mise.jdx.dev/) and the
   global npm/gem/pip packages in `bootstrap/{package.json,Gemfile,requirements.txt}`.
3. Symlinks `~/.local/share/chezmoi` to this repo and runs `chezmoi apply`,
   which renders and places `~/.zshrc` (OS-aware `dot_zshrc.tmpl`),
   `~/.config/nvim` (`dot_config/nvim/`), `~/.config/helix`, `~/.config/herdr`,
   `~/.config/yazi`, and `~/.config/zsh/*` (`dot_config/zsh/`).

`bootstrap.sh`/`bootstrap/`, `Gemfile*`, `venv/`, `.claude/`, and `reference/`
(non-templated assets like the cheatsheet, see below) are excluded from
chezmoi deployment via `.chezmoiignore` - they're repo tooling, not dotfiles.

Once set up, day-to-day usage from anywhere is just:
```sh
chezmoi diff     # preview changes after editing this repo
chezmoi apply    # deploy them
chezmoi update   # git pull + apply in one step
```

## Updating

```sh
./update.sh
```

Detects the OS/distro and upgrades everything for it in one go. **macOS**:
`brew update && brew upgrade --greedy && brew cleanup && brew doctor`, then
`mise plugins update && mise upgrade`, then `chezmoi update` (pulls this repo and
re-applies). **Linux (Debian/Ubuntu, Arch/CachyOS)**: stubbed for now -
exits with a message pointing at `update.sh` until that gets filled in.

### Windows

Fully manual today - no script, no dotfile deployment. Sane defaults +
daily-driver software via [Chocolatey](https://chocolatey.org/install)
([GUI option](https://docs.chocolatey.org/en-us/chocolatey-gui/setup/installation) also available):

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

# Fonts
choco install firacode

# Other
choco install 7zip
```

# Software

## Software Managers
I download all of my software using these unless its unavailable.

- MacOS: [Homebrew](https://brew.sh/)
- Linux: [Homebrew](https://brew.sh/) or default package manager for the distro
- Windows: [Chocolatey](https://chocolatey.org/)

## Browser
- [Vivaldi](https://vivaldi.com)

## Terminals
- MacOS: [Ghostty](https://ghostty.org)
- Linux: [Ghostty](https://ghostty.org)
- Windows: [Windows Terminal]()

## Shell Customization (Unix Only)
Shell: [Zsh](http://zsh.sourceforge.net/) with [Starship](https://starship.rs/) as the prompt

Favorite Colorscheme: [Gruvbox](https://github.com/morhetz/gruvbox) - I literally use this in everything

## Software Version Manager
- MacOS/Linux: [mise](https://mise.jdx.dev/) for Node, Ruby, and Python
- Windows: pyenv-win

## IDEs and Editors:
1. [VSCode](https://code.visualstudio.com/) - My goto GUI editor
1. [Helix](https://helix-editor.com/) - my terminal editor, `dot_config/helix/config.toml` (catppuccin_macchiato theme); also wired up as [Yazi](https://yazi-rs.github.io/)'s file opener (`dot_config/yazi/yazi.toml`)
1. [NeoVim](https://neovim.io/) - configured initially with [vim-bootstrap](https://github.com/editor-bootstrap/vim-bootstrap) and tweaked to my liking
1. [JetBrains IDEs](https://www.jetbrains.com/) - If I want an IDE for some reason these are the best IMO
   NOTE: I manage JetBrains IDEs through the [JetBrains Toolbox](https://www.jetbrains.com/toolbox/app/) after installing it through brew

## Version Control Platforms (I only use git):
- [Gitlab](https://about.gitlab.com/) - Really good CI/CD
- [Github](https://github.com/) - They are catching up to Gitlab

# Other
## Useful Software:
- [tldr](https://tldr.sh/) - man pages but wayyyy better
- [postman](https://www.postman.com/) - API Manager
- [FZF](https://github.com/junegunn/fzf) - fuzzy find, basically necessary
- [ripgrep](https://github.com/BurntSushi/ripgrep) - fast search
- [Docker](https://www.docker.com/) - Containers are magic
- [SwaggerDocs](https://swagger.io/docs/) - Cuz API docs are important
- [zoxide](https://github.com/ajeetdsouza/zoxide) - jump to frecent directories
- [is-up](https://github.com/sindresorhus/is-up-cli)
- [VimWiki](https://github.com/vimwiki/vimwiki) - if I want it
- [Yazi](https://yazi-rs.github.io/) - terminal file manager, opens files in Helix
- [herdr](https://herdr.dev) - agent multiplexer that lives in the terminal

## Useful Links:
- [Regex Tester](https://regexr.com/) - cuz regex is hard
- [Devhints.io](https://devhints.io/) - An amazing cheatsheet website
- [Fowler Design Patterns](https://martinfowler.com/eaaCatalog/index.html) - Design Patterns will save your life
- [Hipsum](https://hipsum.co/) - generates ipsum nicely
- [Cucumber](https://cucumber.io/) - BDD is important kiddos
- [Smell -> Refactorings](https://www.industriallogic.com/wp-content/uploads/2005/09/smellstorefactorings.pdf) - Nice little guide for refactorings
- [VimAwesome](https://vimawesome.com/) - Useful vim stuff
- ... more OTW
