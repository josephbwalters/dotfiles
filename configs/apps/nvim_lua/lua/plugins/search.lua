return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- FZF-native sorter for instant results
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- Project root + recent projects
      "ahmedkhalf/project.nvim",
    },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
      { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects" },
    },
    opts = {
      defaults = {
        prompt_prefix = "   ",
        sorting_strategy = "ascending",
        layout_config = { prompt_position = "top" },
        mappings = { i = { ["<C-k>"] = "move_selection_previous", ["<C-j>"] = "move_selection_next" } },
      },
      pickers = {
        find_files = { hidden = true }, -- also show dotfiles
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
      telescope.load_extension("projects")
      require("project_nvim").setup({})
    end,
  },
}

