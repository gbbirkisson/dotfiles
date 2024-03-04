local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")


local opts = {
  sources = {
    -- Python
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.ruff,
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.diagnostics.mypy,

    -- Rust
    null_ls.builtins.formatting.rustfmt.with({
      extra_args = { "--edition", "2021" },
    }),

    -- YAML
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.formatting.yamlfmt,

    -- Toml
    null_ls.builtins.formatting.taplo,

    -- Bash
    null_ls.builtins.formatting.shfmt.with({
      generator_opts = {
        command = "shfmt",
        args = { "-i=4", "-filename", "$FILENAME" },
        to_stdin = true,
      },
    }),

    -- Terraform
    -- null_ls.builtins.diagnostics.terraform_validate,

    -- Other
    null_ls.builtins.hover.printenv,
    null_ls.builtins.hover.dictionary,
    null_ls.builtins.diagnostics.typos,
    null_ls.builtins.diagnostics.trail_space,
    -- null_ls.builtins.diagnostics.todo_comments,
  },
  on_attach = function(client, bufnr)
    -- Auto-format on save
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          local ft = vim.bo.filetype
          if ft == "yaml" then
            return
          end

          vim.lsp.buf.format({ bufnr = bufnr })
        end
      })
    end
  end,
}

return opts
