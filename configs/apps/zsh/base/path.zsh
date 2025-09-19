
# Start from a sane base; add per-OS below.
path=("$HOME/.local/bin" $path)

# macOS (Homebrew first) — guarded so it’s harmless on Linux
if command -v brew >/dev/null 2>&1; then
  BREW_PREFIX="$(brew --prefix)"
  path=("$BREW_PREFIX/bin" "$BREW_PREFIX/sbin" $path)
fi

# Common extras
path=("/usr/local/sbin" "/usr/local/bin" $path)
export PATH
