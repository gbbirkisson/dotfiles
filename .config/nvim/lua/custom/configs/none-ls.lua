local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
  sources = {
    -- Python
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,

    -- Rust
    null_ls.builtins.formatting.rustfmt.with({
        extra_args = { "--edition", "2021" },
    }),

    -- YAML
    null_ls.builtins.diagnostics.yamllint,
  },
  on_attach = function (client, bufnr)
    -- Auto-format on save
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function ()
          local ft = vim.bo.filetype
          if ft == "yaml" or ft == "toml" then
            return
          end
          vim.lsp.buf.format({ bufnr = bufnr })
        end
      })
    end
  end,
}

return opts
