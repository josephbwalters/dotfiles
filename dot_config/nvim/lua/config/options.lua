local opt = vim.opt

-- General
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.termguicolors = true
opt.signcolumn = "yes"
opt.updatetime = 200
opt.timeoutlen = 400
opt.hidden = true
opt.swapfile = false
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.clipboard = "unnamedplus"

opt.foldmethod = "expr"
opt.foldexpr   = "v:lua.vim.treesitter.foldexpr()"
opt.foldenable = true
opt.foldlevel  = 99

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
opt.wildignore = { "*.o", "*.a", "__pycache__", "*.pyc", "node_modules", "dist", "build" }

-- Suppress intro message ("NVIM v0.x.x / type :help...")
opt.shortmess:append("I")

-- Disable unused providers (silences checkhealth warnings)
vim.g.loaded_perl_provider   = 0
vim.g.loaded_ruby_provider   = 0
vim.g.loaded_python3_provider = 0

