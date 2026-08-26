return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Neotree" },
    keys = {
      {
        "<leader>e",
        function()
          if vim.bo.filetype == "snacks_dashboard" then
            -- snacks fires BufDelete + BufWipeout on its bufhidden=wipe buffer and
            -- tries to delete its augroup both times; pcall swallows the harmless 2nd error
            pcall(vim.cmd, "enew")
          end
          vim.cmd("Neotree toggle left")
        end,
        desc = "Explorer",
      },
    },
    opts = {
      filesystem = {
        follow_current_file = { enabled = true },
        filtered_items = { hide_dotfiles = false, hide_gitignored = true },
      },
      window = { width = 40 },
    },
  },
}

