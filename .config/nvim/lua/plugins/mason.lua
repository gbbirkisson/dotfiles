return {
  {
    "mason.nvim",
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
}
