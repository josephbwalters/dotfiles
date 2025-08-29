-- lua/plugins/navigation.lua
return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")

      -- Persist per-project lists; auto-save when you open/close the UI
      harpoon:setup({
        settings = {
          save_on_toggle = true,
          sync_on_ui_close = true,
          -- each project gets its own list keyed by CWD
          key = function() return vim.loop.cwd() end,
        },
      })

      -- Keymaps (tweak to taste)
      local add = function() harpoon:list():add() end
      local menu = function() harpoon.ui:toggle_quick_menu(harpoon:list()) end
      vim.keymap.set("n", "<leader>ha", add,  { desc = "Harpoon: add file" })
      vim.keymap.set("n", "<leader>hh", menu, { desc = "Harpoon: menu" })

      -- Fast-jump slots (your daily hot files)
      vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon 1" })
      vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon 2" })
      vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon 3" })
      vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon 4" })
      -- Navigate list next/prev (nice when cycling between two files)
      vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Harpoon next" })
      vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Harpoon prev" })
    end,
  },
}

