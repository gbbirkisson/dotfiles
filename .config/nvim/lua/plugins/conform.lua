-- Resolve the gigja catalog formatter (scripts/format-songs.py) by walking up
-- from the buffer to the repo's `scripts/` dir. Returns nil outside that repo so
-- conform's `condition` can skip .cho files elsewhere.
local function chordpro_script(ctx)
  local scripts = vim.fs.find("scripts", { path = ctx.dirname, upward = true, type = "directory" })[1]
  if scripts then
    local p = scripts .. "/format-songs.py"
    if vim.uv.fs_stat(p) then
      return p
    end
  end
  return nil
end

return {
  {
    "stevearc/conform.nvim",
    opts = {
      default_format_opts = {
        lsp_format = "fallback",
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
        sql_formatter = {
          -- sqlite dialect with ?1, ?2 numbered params (for sqlx compatibility)
          prepend_args = {
            "--language",
            "sqlite",
            "--config",
            '{"paramTypes": {"numbered": ["?"]}}',
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
        injected = {
          -- ignore errors from injected regions that contain templated values
          -- (e.g. alloy config with Go/Helm templates)
          options = {
            ignore_errors = true,
          },
        },
        gherkin = {
          command = "uvx",
          args = { "reformat-gherkin@3.0.1", "--tab-width", "4", "-" },
          stdin = true,
        },
        chordpro_fmt = {
          -- gigja catalog styleguide formatter (scripts/format-songs.py --stdin)
          command = function(_, ctx)
            return chordpro_script(ctx) or "format-songs.py"
          end,
          args = { "--stdin" },
          stdin = true,
          condition = function(_, ctx)
            return chordpro_script(ctx) ~= nil
          end,
        },
      },
      formatters_by_ft = {
        chordpro = { "chordpro_fmt" },
        sql = { "sql_formatter" },
        river = { "alloy" },
        cucumber = { "gherkin" },
        lua = { "stylua" },
        python = { "ruff_format", "ruff_organize_imports" },
        sh = { "shfmt" },
        rust = { "rustfmt" },
        go = { "goimports", "gofmt" },
        toml = { "taplo" },
        fish = { "fish_indent" },
        yaml = { "yamlfmt" },
        terraform = { "tofu_fmt" },
        jsonnet = { lsp_format = "prefer" },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        just = { "just", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        svelte = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        zig = { "zigfmt" },
        -- "injected" formats treesitter injection regions (e.g. SQL inside Rust strings)
        ["*"] = { "trim_whitespace", "injected" },
      },
    },
  },
}
