
# fzf keybindings if installed (works on mac via brew or Linux via HM pkgs)
if command -v fzf >/dev/null 2>&1; then
  # try common locations
  for p in \
    "$(command -v brew >/dev/null 2>&1 && brew --prefix)/opt/fzf/shell/key-bindings.zsh" \
    "/usr/share/fzf/key-bindings.zsh" \
    "/etc/profile.d/fzf-keybindings.zsh"
  do [ -r "$p" ] && . "$p" && break; done
fi

command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"
command -v direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"
