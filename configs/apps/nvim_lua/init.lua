-- Speed up Lua module loading (NVIM 0.9+)
if vim.loader then vim.loader.enable() end

-- Set <leader> early
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Plugin manager + plugins
require("plugins")

-- Core config
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- (Optional) temporary: source any legacy .vim files while you migrate
-- require("config.legacy_bridge")

