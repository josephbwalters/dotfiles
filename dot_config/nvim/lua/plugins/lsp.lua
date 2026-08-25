return {
  -- Installer
  { "williamboman/mason.nvim", opts = {} },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "ts_ls", "jsonls", "yamlls" },
      automatic_enable = true,   -- mason-lspconfig v2: auto-calls vim.lsp.enable() for installed servers
    },
  },
  -- Auto-install formatters and linters used by conform + nvim-lint
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = { "stylua", "prettier", "eslint_d", "jq", "jsonlint", "yamllint" },
    },
  },
  -- LSP (native vim.lsp.config API — Neovim 0.11+, nvim-lspconfig 1.0+)
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "williamboman/mason-lspconfig.nvim" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Apply capabilities to every server automatically
      vim.lsp.config("*", { capabilities = capabilities })

      -- Server-specific settings (on top of the defaults above)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })
    end,
  },
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
            else fallback() end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then luasnip.jump(-1)
            else fallback() end
          end, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "buffer" },
        },
      })
    end,
  },
}

