return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        taplo = {
          -- https://taplo.tamasfe.dev/configuration/formatter-options.html
          args = { "format", "-o", "array_auto_collapse=false", "-" },
        },
        shfmt = {
          prepend_args = { "-i", "4" },
        },
        rustfmt = {
          options = {
            default_edition = "2024",
          },
        },
        alloy = {
          command = "alloy",
          args = { "fmt" },
          stdin = true,
        },
      },
      formatters_by_ft = {
        river = { "alloy" },
        lua = { "stylua" },
        python = { "isort", "ruff_format", "ruff_organize_imports" },
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
