return {
  {
    "mason.nvim",
    opts = {
      ensure_installed = {
        -- Go
        "goimports",

        -- Jsonnet
        "jsonnet-language-server",

        -- Python
        "ruff",

        -- SQL
        "sql-formatter",

        -- Toml
        "taplo",
      },
    },
  },
}
