# Neovim Cheatsheet

> Leader = `<Space>`

---

## Core

| Key | Action |
|-----|--------|
| `<leader>w` | Save |
| `<leader>q` | Quit |
| `<leader>nh` | Clear search highlight |
| `<C-h/j/k/l>` | Navigate windows |
| `<S-l>` / `<S-h>` | Next / prev buffer |
| `<leader>bn` | New buffer |
| `<leader>bd` | Delete buffer |
| `<leader>?` | Open this cheatsheet |

---

## File Explorer  `<leader>e`

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle Neo-tree |

---

## Find / Telescope  `<leader>f`

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fp` | Projects |
| `<leader>ft` | Find TODOs |
| `<C-j>` / `<C-k>` | Move down / up in picker |

---

## Harpoon  `<leader>h`

| Key | Action |
|-----|--------|
| `<leader>ha` | Add file to list |
| `<leader>hh` | Open quick menu |
| `<leader>1-4` | Jump to slot 1–4 |
| `<leader>hn` / `<leader>hp` | Next / prev in list |

---

## LSP

| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | References |
| `gi` | Go to implementation |
| `[d` / `]d` | Prev / next diagnostic |
| `<leader>cf` | Format buffer (conform) |

### Completion (nvim-cmp)

| Key | Action |
|-----|--------|
| `<C-Space>` | Trigger completion |
| `<CR>` | Confirm selection |
| `<Tab>` / `<S-Tab>` | Next / prev item or snippet jump |

---

## Diagnostics / Trouble  `<leader>x`

| Key | Action |
|-----|--------|
| `<leader>xx` | All diagnostics |
| `<leader>xw` | Buffer diagnostics |
| `<leader>xs` | Symbols |
| `<leader>xq` | Quickfix list |

---

## Git  `<leader>g`

| Key | Action |
|-----|--------|
| `<leader>gg` | LazyGit (float) |
| `<leader>gB` | Browse file on remote |
| `<leader>gp` | Preview hunk |
| `<leader>gs` | Stage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gu` | Undo stage hunk |
| `<leader>gb` | Blame line |
| `<leader>gd` | Diff this |
| `]h` / `[h` | Next / prev hunk |

---

## AI  `<leader>a`

| Key | Action |
|-----|--------|
| `<leader>ac` | Toggle Claude Code |
| `<leader>as` | Send visual selection to Claude |

---

## TODO Comments

| Key | Action |
|-----|--------|
| `]t` / `[t` | Next / prev TODO |
| `<leader>ft` | Search TODOs in Telescope |

---

## Editing

### Comment (Comment.nvim)

| Key | Action |
|-----|--------|
| `gcc` | Toggle line comment |
| `gc{motion}` | Toggle comment (e.g. `gcap`) |
| `gb{motion}` | Block comment |

### Surround (nvim-surround)

| Key | Action |
|-----|--------|
| `ys{motion}{char}` | Add surround (e.g. `ysiw"`) |
| `ds{char}` | Delete surround (e.g. `ds"`) |
| `cs{old}{new}` | Change surround (e.g. `cs"'`) |
| `S{char}` | Surround visual selection |

---

## Folds (Treesitter)

| Key | Action |
|-----|--------|
| `za` | Toggle fold |
| `zo` / `zc` | Open / close fold |
| `zR` / `zM` | Open all / close all folds |

---

## UI / Misc

| Key | Action |
|-----|--------|
| `<leader>un` | Notification history |

---

## Vim Built-ins (reference)

| Key | Action |
|-----|--------|
| `*` / `#` | Search word under cursor fwd / back |
| `<C-o>` / `<C-i>` | Jump back / forward in jumplist |
| `%` | Jump to matching bracket |
| `ciw` / `diw` / `yiw` | Change / delete / yank word |
| `V` → `J` / `K` | Move lines in visual mode (`:m`) |
| `q{r}` / `@{r}` | Record / replay macro |
