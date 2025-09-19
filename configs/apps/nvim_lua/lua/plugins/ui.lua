return {
  { 
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = { 
      transparent_background = true,
      auto_integrations = true,
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   opts = { contrast = "hard" },
  --   config = function(_, opts)
  --     require("gruvbox").setup(opts)
  --     vim.cmd.colorscheme("gruvbox")
  --   end,
  -- },

  -- Statusline (Airline → lualine)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = { theme = "catppuccin", globalstatus = true, section_separators = "", component_separators = "" },
      -- options = { theme = "gruvbox", globalstatus = true, section_separators = "", component_separators = "" },
    },
  },
  -- Git signs in the sign column
  { "lewis6991/gitsigns.nvim", opts = {} },
}

