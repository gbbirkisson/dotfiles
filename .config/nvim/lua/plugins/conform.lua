return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        shfmt = {
          prepend_args = { "-i", "4" },
        },
        rustfmt = {
          options = {
            default_edition = "2021",
          },
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format", "isort", "black" },
        sh = { "shfmt" },
        rust = { "rustfmt" },
        toml = { "taplo" },
        fish = { "fish_indent" },
        yaml = { "yamlfmt" },
        javascript = { { "prettier", "prettierd" } },
        ["*"] = { "trim_whitespace" },
      },
    },
  },
}
