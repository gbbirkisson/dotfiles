local plugins = {
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python", "rust"},
    opts = function ()
      return require("custom.configs.null-ls")
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Python
        "black",
        "mypy",
        "ruff",
        "pyright",

        -- Rust
        "rust-analyzer",
        "rustfmt",
      }
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  }
}

return plugins
