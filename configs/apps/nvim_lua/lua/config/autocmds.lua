local aug = vim.api.nvim_create_augroup
local acmd = vim.api.nvim_create_autocmd

local mygroup = aug("MyAutocmds", { clear = true })

-- Example: filetype-specific tweaks (maps your old filetypes.vim)
acmd("FileType", {
  group = mygroup,
  pattern = { "json", "yaml", "lua" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

-- Example: quickly toggle relative numbers in insert mode
acmd({ "InsertEnter" }, {
  group = mygroup,
  callback = function() vim.opt.relativenumber = false end,
})
acmd({ "InsertLeave" }, {
  group = mygroup,
  callback = function() vim.opt.relativenumber = true end,
})

