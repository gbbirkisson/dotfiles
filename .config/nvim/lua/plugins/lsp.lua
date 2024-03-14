return {
  { -- Formatting
    'stevearc/conform.nvim',
    opts = {
      lsp_fallback = true,
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },
  { -- Tool installer
    'williamboman/mason.nvim',
    lazy = false,
    config = function()
      -- We will setup mason with the lsp-config down below
    end,
  },
  { -- Lsp Setup
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      require 'configs.lspconfig'
    end,
  },
  { -- Nice TODO highlighting
    'folke/todo-comments.nvim',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
