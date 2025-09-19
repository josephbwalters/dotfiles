
# luarocks (if present)
command -v luarocks >/dev/null 2>&1 && eval "$(luarocks --lua-version=5.4 path --bin)"

# keymap
bindkey -e

# Dirty work alias (maps to pay-respects package)
alias f="fuck"

# Project opener
codehere() { command -v code >/dev/null && code . || true; }
