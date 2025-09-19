-- Bootstrap lazy.nvim
-- From https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- split plugin specs across files for clarity
  { import = "plugins.ui" },
  { import = "plugins.filetree" },
  { import = "plugins.search" },
  { import = "plugins.editing" },
  { import = "plugins.treesitter" },
  { import = "plugins.lsp" },
  { import = "plugins.start" },
  { import = "plugins.lint_format" },
  { import = "plugins.navigation" },
  { import = "plugins.indent-blankline" },
  { import = "plugins.glow" },
  { import = "plugins.copilot" },
  { import = "plugins.vim-tmux-navigator" },
}, {
  ui = { border = "rounded" },
  change_detection = { notify = false },
})

