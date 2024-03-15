vim.b.disable_autoformat = false
vim.g.disable_autoformat = false

vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})
vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})

local opts = {
  notify_on_error = false,
  lsp_fallback = true,
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 500, lsp_fallback = true }
  end,
  formatters = {
    shfmt = {
      prepend_args = { '-i', '4' },
    },
    rustfmt = {
      options = {
        default_edition = '2021',
      },
    },
  },
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'ruff_format', 'isort', 'black' },
    sh = { 'shfmt' },
    rust = { 'rustfmt' },
    toml = { 'taplo' },
    yaml = { 'yamlfmt' },
    javascript = { { 'prettier', 'prettierd' } },
    ['*'] = { 'trim_whitespace' },
  },
}

return opts
