return {
  -- Claude Code CLI integration (uses your existing `claude` CLI, no extra API key needed)
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<cr>",     desc = "Claude: toggle" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Claude: send selection" },
    },
  },
  -- GitLab Duo Code Suggestions + Chat (needs GITLAB_TOKEN + GITLAB_URL env vars)
  {
    "git@gitlab.com:gitlab-org/editor-extensions/gitlab.vim.git",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      code_suggestions = { enabled = true },
      statusline        = { enabled = true },
    },
  },
}
