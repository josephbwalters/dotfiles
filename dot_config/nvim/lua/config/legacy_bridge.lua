-- Adjust paths to wherever you keep these
local legacy = {
  vim.fn.stdpath("config") .. "/abbrev.vim",
  vim.fn.stdpath("config") .. "/mappings.vim",
  vim.fn.stdpath("config") .. "/grep.vim",
  vim.fn.stdpath("config") .. "/ui.vim",
  vim.fn.stdpath("config") .. "/nerdtree.vim",
  vim.fn.stdpath("config") .. "/startify.vim",
  vim.fn.stdpath("config") .. "/airline.vim",
  vim.fn.stdpath("config") .. "/filetypes.vim",
  vim.fn.stdpath("config") .. "/plugins.vim",
  vim.fn.stdpath("config") .. "/ale.vim",
}

for _, f in ipairs(legacy) do
  if vim.loop.fs_stat(f) then
    vim.cmd("source " .. f)
  end
end

