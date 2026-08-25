#!/bin/bash
# One-line OS update: ./update.sh
# Detects OS/distro and runs the matching update routine.
set -euo pipefail

update_mac() {
  if command -v brew >/dev/null 2>&1; then
    echo '==> Updating Homebrew packages'
    brew update
    brew upgrade --greedy
    brew cleanup
    brew doctor || true
  fi

  if command -v mise >/dev/null 2>&1; then
    echo '==> Updating mise plugins/runtimes'
    mise plugins update
    mise upgrade
  fi

  if command -v chezmoi >/dev/null 2>&1; then
    echo '==> Updating dotfiles (chezmoi)'
    chezmoi update
  fi
}

update_debian() {
  echo 'Linux (Debian/Ubuntu) update not implemented yet - see update.sh' >&2
  exit 1
}

update_arch() {
  echo 'Linux (Arch/CachyOS) update not implemented yet - see update.sh' >&2
  exit 1
}

case "$(uname -s)" in
  Darwin)
    update_mac
    ;;
  Linux)
    . /etc/os-release
    case "${ID_LIKE:-$ID}" in
      *arch*)
        update_arch
        ;;
      *debian*)
        update_debian
        ;;
      *)
        echo "Unrecognized distro (ID=${ID:-unknown}, ID_LIKE=${ID_LIKE:-unset})" >&2
        exit 1
        ;;
    esac
    ;;
  *)
    echo "Unsupported OS: $(uname -s)" >&2
    exit 1
    ;;
esac

echo '==> Update complete'
