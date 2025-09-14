
#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../../stow"

# pick packages you want to manage with stow
PKGS=(zsh git nvim kitty)

for p in "${PKGS[@]}"; do
  echo "Stowing $p → $HOME"
  stow -v -t "$HOME" "$p"
done

echo "Done."
