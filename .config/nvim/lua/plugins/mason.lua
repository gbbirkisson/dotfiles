return {
  {
    -- https://github.com/LazyVim/LazyVim/issues/6039
    "mason.nvim",
    version = "^1.0.0",
    opts = {
      ensure_installed = {
        -- Python
        "isort",
        "black",
        "ruff",

        -- Toml
        "taplo",
      },
    },
  },
  { "mason-lspconfig.nvim", version = "^1.0.0" },
}
