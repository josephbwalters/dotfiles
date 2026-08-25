#!/bin/bash
# One-line setup: ./bootstrap.sh
# Detects OS, installs system packages (Homebrew + Brewfile), language
# runtimes (mise), global npm/gem/pip packages, then deploys dotfiles
# via chezmoi. Safe to re-run - every step is idempotent.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BOOTSTRAP="$DOTFILES/bootstrap"

brew_shellenv() {
  [ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
  [ -x /usr/local/bin/brew ] && eval "$(/usr/local/bin/brew shellenv)"
  [ -x /home/linuxbrew/.linuxbrew/bin/brew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  return 0
}

case "$(uname -s)" in
  Darwin)
    echo '==> macOS: installing Xcode command line tools'
    xcode-select --install 2>/dev/null || true

    echo '==> macOS: installing Homebrew'
    if ! command -v brew >/dev/null 2>&1; then
      NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew_shellenv

    BREWFILE="$BOOTSTRAP/Brewfile.mac"
    ;;
  Linux)
    . /etc/os-release
    echo '==> Linux: installing Homebrew build prerequisites'
    case "${ID_LIKE:-$ID}" in
      *arch*)
        sudo pacman -Sy --needed --noconfirm base-devel procps-ng curl file git zsh
        ;;
      *debian*)
        sudo apt-get update
        sudo apt-get install -y build-essential procps curl file git zsh
        ;;
      *)
        echo "Unrecognized distro (ID=${ID:-unknown}, ID_LIKE=${ID_LIKE:-unset}) - install Homebrew's build prerequisites manually: https://docs.brew.sh/Homebrew-on-Linux" >&2
        exit 1
        ;;
    esac

    echo '==> Linux: installing Homebrew'
    if ! command -v brew >/dev/null 2>&1; then
      NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    BREW_SHELLENV='eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
    grep -qxF "$BREW_SHELLENV" "$HOME/.zprofile" 2>/dev/null || echo "$BREW_SHELLENV" >> "$HOME/.zprofile"
    brew_shellenv

    BREWFILE="$BOOTSTRAP/Brewfile.linux"
    ;;
  *)
    echo "Unsupported OS: $(uname -s)" >&2
    exit 1
    ;;
esac

echo '==> Installing packages from Brewfile'
brew bundle --file="$BREWFILE"

echo '==> Installing language runtimes via mise'
mise use --global node@latest ruby@latest python@latest
eval "$(mise activate bash)"

echo '==> Installing global npm/yarn packages'
GLOBAL_PKGS=$(node -pe "Object.keys(require('$BOOTSTRAP/package.json').dependencies).join(' ')")
yarn global add $GLOBAL_PKGS

echo '==> Installing python requirements'
pip install -r "$BOOTSTRAP/requirements.txt"

echo '==> Installing ruby gems'
bundle install --gemfile="$BOOTSTRAP/Gemfile"

echo '==> Pointing chezmoi at this repo and applying dotfiles'
CHEZMOI_SOURCE="$HOME/.local/share/chezmoi"
mkdir -p "$HOME/.local/share"
if [ -L "$CHEZMOI_SOURCE" ]; then
  ln -sfn "$DOTFILES" "$CHEZMOI_SOURCE"
elif [ -e "$CHEZMOI_SOURCE" ]; then
  echo "Refusing to overwrite existing non-symlink $CHEZMOI_SOURCE - move it aside first" >&2
  exit 1
else
  ln -s "$DOTFILES" "$CHEZMOI_SOURCE"
fi
chezmoi apply

echo '==> Bootstrap complete - restart your shell'
