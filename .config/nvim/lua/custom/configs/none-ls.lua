local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
  sources = {
    -- Python
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.ruff,
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.diagnostics.mypy.with({
      command = function()
        -- Check if we are running in a virtual env
        local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")

        if virtual then
          return virtual .. "/bin/python3"
        else
          return "mypy"
        end
      end,
      args = function(params)
        -- Check if we are running in a virtual env
        local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")

        local mypy_args = {
          "--hide-error-codes",
          "--hide-error-context",
          "--no-color-output",
          "--show-absolute-path",
          "--show-column-numbers",
          "--show-error-codes",
          "--no-error-summary",
          "--no-pretty",
          "--shadow-file",
          params.bufname,
          params.temp_path,
          params.bufname,
        }

        if virtual then
          return {"-m", "mypy", unpack(mypy_args)}
        else
          return mypy_args
        end
      end,
    }),

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
    null_ls.builtins.formatting.shfmt,

    -- Terraform
    -- null_ls.builtins.diagnostics.terraform_validate,

    -- Other
    null_ls.builtins.hover.printenv,
    null_ls.builtins.hover.dictionary,
    null_ls.builtins.diagnostics.typos,
    null_ls.builtins.diagnostics.trail_space,
    null_ls.builtins.diagnostics.todo_comments,
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
