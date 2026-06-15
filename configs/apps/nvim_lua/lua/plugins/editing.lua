return {
  { "numToStr/Comment.nvim", opts = {} },
  { "kylechui/nvim-surround", version = "*", opts = {} },
  { "windwp/nvim-autopairs", opts = {} },
  -- Better diagnostics, quickfix, and loclist panel
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",                        desc = "Diagnostics" },
      { "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",           desc = "Buffer diagnostics" },
      { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>",                desc = "Symbols" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<cr>",                             desc = "Quickfix" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {},
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.add({
        { "<leader>f",  group = "Find (Telescope)" },
        { "<leader>g",  group = "Git" },
        { "<leader>h",  group = "Harpoon" },
        { "<leader>c",  group = "Code" },
        { "<leader>b",  group = "Buffer" },
        { "<leader>a",  group = "AI" },
        { "<leader>x",  group = "Diagnostics" },
        { "<leader>u",  group = "UI" },
      })
    end,
  },
}

