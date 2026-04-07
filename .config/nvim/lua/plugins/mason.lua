return {
  {
    "mason.nvim",
    opts = {
      ensure_installed = {
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
