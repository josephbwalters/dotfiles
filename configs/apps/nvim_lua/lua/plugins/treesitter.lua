return {
-- in your treesitter plugin spec
{
  "nvim-treesitter/nvim-treesitter",
  lazy = false,                   -- load at startup
  priority = 900,                 -- after your colorscheme (1000), before others
  build = ":TSUpdate",
  opts = {
    highlight = { enable = true, additional_vim_regex_highlighting = false },
    indent = { enable = true },
    ensure_installed = {
      "lua", "vim", "vimdoc", "json", "yaml",
      "tsx", "typescript", "javascript", "markdown",
      "python",   -- 👈 add this
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}

}

