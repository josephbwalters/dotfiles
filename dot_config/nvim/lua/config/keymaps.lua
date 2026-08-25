local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Quick save / quit
map("n", "<leader>w", "<cmd>w<cr>", opts)
map("n", "<leader>q", "<cmd>q<cr>", opts)

-- Clear search highlight
map("n", "<leader>nh", "<cmd>nohlsearch<cr>", opts)

-- Better window nav
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Tabs vs buffers (you mentioned airline/tabline)
map("n", "<leader>bn", "<cmd>enew<cr>", opts)
map("n", "<leader>bd", "<cmd>bd<cr>", opts)
map("n", "<S-l>", "<cmd>bnext<cr>", opts)
map("n", "<S-h>", "<cmd>bprevious<cr>", opts)

-- Cheatsheet
map("n", "<leader>?", "<cmd>Glow ~/Development/dotfiles/reference/nvim_cheatsheet.md<cr>", { noremap = true, silent = true, desc = "Cheatsheet" })

