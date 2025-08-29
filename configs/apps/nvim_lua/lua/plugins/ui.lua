return {
  -- Colorscheme (keep gruvbox if that’s your standard)
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = { contrast = "hard" },
    config = function(_, opts)
      require("gruvbox").setup(opts)
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  -- Statusline (Airline → lualine)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = { theme = "gruvbox", globalstatus = true, section_separators = "", component_separators = "" },
    },
  },
  -- Git signs in the sign column
  { "lewis6991/gitsigns.nvim", opts = {} },
}

