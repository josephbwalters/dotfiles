# Shell & Tmux Quick Reference

---

## Tmux  (prefix = C-a)

### Sessions
| Key | Action |
|-----|--------|
| `prefix + f` | Sessionize — fzf pick a repo, open in new session |
| `prefix + s` | Switch between existing sessions (fzf) |
| `prefix + $` | Rename current session |
| `prefix + d` | Detach |

### Windows
| Key | Action |
|-----|--------|
| `prefix + c` | New window |
| `prefix + n` | Next window |
| `prefix + p` | Previous window |
| `prefix + ,` | Rename window |

### Panes
| Key | Action |
|-----|--------|
| `prefix + \|` | Split vertical |
| `prefix + -` | Split horizontal |
| `C-\` | Split vertical (no prefix) |
| `C--` | Split horizontal (no prefix) |
| `C-h/j/k/l` | Navigate panes (nvim-aware) |
| `M-h/j/k/l` | Resize panes |
| `prefix + H/J/K/L` | Resize panes (prefix mode) |
| `prefix + x` | Kill pane |
| `prefix + z` | Zoom/unzoom pane |

### Copy mode (vi)
| Key | Action |
|-----|--------|
| `prefix + [` | Enter copy mode |
| `v` | Begin selection |
| `y` | Copy to clipboard (pbcopy) |
| `q` | Exit copy mode |

---

## ZSH Aliases

### Navigation
| Alias | Expands to |
|-------|-----------|
| `z <dir>` | Jump to dir (zoxide) |
| `zc` | `z -` (jump back) |
| `ts` | sessionize (fzf → new tmux session) |
| `tw` | tsw (fzf → switch tmux session) |

### Files
| Alias | Expands to |
|-------|-----------|
| `ls` | `eza --group-directories-first --icons` |
| `ll` | `ls -lah` |
| `cat` | `bat --paging=never` |
| `rm` | `rm -i` (interactive) |
| `cp` | `cp -i` (interactive) |
| `mv` | `mv -i` (interactive) |

### Git
| Alias | Expands to |
|-------|-----------|
| `g` | `git` |
| `ga` | `git add -A` |
| `gc` | `git commit -v` |
| `gco` | `git checkout` |
| `gb` | `git branch -vv` |
| `gl` | `git log --oneline --graph --decorate --all` |

### Other
| Alias | Expands to |
|-------|-----------|
| `GET` | `http --follow --timeout 30 --verbose GET` |
| `cheat` | Show this cheat sheet |

---

## FZF Key Bindings
| Key | Action |
|-----|--------|
| `C-r` | Search shell history |
| `C-t` | Insert file path |
| `M-c` | cd into directory |
