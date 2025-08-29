local opt = vim.opt

-- General
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.termguicolors = true            -- replaces legacy t_Co / guioptions usage
opt.signcolumn = "yes"
opt.updatetime = 200
opt.timeoutlen = 400
opt.hidden = true
opt.swapfile = false
opt.scrolloff = 4
opt.sidescrolloff = 8
vim.opt.clipboard = "unnamedplus"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr   = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel  = 99

-- Indent
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Performance / wildignore (great for big repos)
opt.wildignore = { "*.o", "*.a", "__pycache__", "*.pyc", "node_modules", "dist", "build" } -- :contentReference[oaicite:5]{index=5}

-- Colorscheme (gruvbox example; swap to whatever you use)
-- You'll actually load the plugin in plugins/ui.lua; this just picks it.
-- vim.cmd.colorscheme("gruvbox")

