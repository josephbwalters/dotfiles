return {
  -- Floating cmdline, messages, and popupmenu
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search    = true,
        command_palette  = true,
        long_message_to_split = true,
      },
    },
  },
  -- LSP progress spinner bottom-right
  { "j-hui/fidget.nvim", opts = {} },
  -- Highlight and search TODO/FIXME/HACK/NOTE comments
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next TODO" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev TODO" },
    },
  },
  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = { flavour = "macchiato" },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin-macchiato")
    end,
  },
  -- Statusline (Airline → lualine)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = { theme = "catppuccin-macchiato", globalstatus = true, section_separators = "", component_separators = "" },
    },
  },
  -- Git signs in the sign column
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local m = function(k, f, d)
          vim.keymap.set("n", k, f, { buffer = bufnr, desc = d })
        end
        m("<leader>gp", gs.preview_hunk,              "Git: preview hunk")
        m("<leader>gs", gs.stage_hunk,                "Git: stage hunk")
        m("<leader>gr", gs.reset_hunk,                "Git: reset hunk")
        m("<leader>gu", gs.undo_stage_hunk,           "Git: undo stage hunk")
        m("<leader>gb", gs.blame_line,                "Git: blame line")
        m("<leader>gd", gs.diffthis,                  "Git: diff this")
        m("]h",         gs.next_hunk,                 "Git: next hunk")
        m("[h",         gs.prev_hunk,                 "Git: prev hunk")
      end,
    },
  },
}

