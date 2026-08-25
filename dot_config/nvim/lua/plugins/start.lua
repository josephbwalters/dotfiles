return {
  -- Animated ASCII splash screen
  { "Amansingh-afk/milli.nvim", lazy = false, enabled = false },

  -- Dashboard + lazygit float + notifications + smooth scroll + animations + indent guides
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = {
        enabled = true,
        sections = {
          { section = "keys",         gap = 1, padding = 1 },
          { section = "recent_files", limit = 5, padding = 1 },
          { section = "startup" },
        },
      },
      lazygit   = { enabled = true },
      notifier  = { enabled = true, timeout = 3000 },
      scroll    = { enabled = true },
      animate   = { enabled = true },
      indent    = { enabled = true },
    },
    keys = {
      { "<leader>gg", function() Snacks.lazygit() end,               desc = "LazyGit" },
      { "<leader>gB", function() Snacks.gitbrowse() end,             desc = "Git browse" },
      { "<leader>un", function() Snacks.notifier.show_history() end, desc = "Notifications" },
    },
  },
}
