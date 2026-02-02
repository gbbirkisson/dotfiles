return {
  {
    "stevearc/conform.nvim",
    opts = {
      default_format_opts = {
        lsp_format = "first",
      },
      formatters = {
        taplo = {
          -- https://taplo.tamasfe.dev/configuration/formatter-options.html
          args = {
            "format",
            -- "-o",
            -- "array_auto_collapse=false",
            -- "-o",
            -- "array_auto_expand=false",
            "-o",
            "column_width=120",
            "-",
          },
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
        gherkin = {
          command = "uvx",
          args = { "reformat-gherkin@3.0.1", "--tab-width", "4", "-" },
          stdin = true,
        },
      },
      formatters_by_ft = {
        river = { "alloy" },
        cucumber = { "gherkin" },
        lua = { "stylua" },
        python = { "isort", "ruff_format", "ruff_organize_imports" },
        sh = { "shfmt" },
        rust = { "rustfmt" },
        toml = { "taplo" },
        fish = { "fish_indent" },
        yaml = { "yamlfmt" },
        terraform = { "tofu_fmt" },
        -- javascript = { "prettier", "prettierd" },
        -- html = { "prettier", "prettierd" },
        css = { "prettier", "prettierd" },
        ["*"] = { "trim_whitespace" },
      },
    },
  },
}
