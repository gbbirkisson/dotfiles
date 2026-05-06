return {
  {
    "mason.nvim",
    opts = {
      ensure_installed = {
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
