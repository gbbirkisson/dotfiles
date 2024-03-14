require 'nvchad.options'

-- Add function to set colorcolumn and textwidth
vim.api.nvim_create_user_command('Gl', function(opts)
  vim.api.nvim_set_option_value('colorcolumn', opts.fargs[1], {})
  vim.api.nvim_set_option_value('textwidth', tonumber(opts.fargs[1]), {})
end, { nargs = 1 })

-- Default to 96, because github diff view looks nice with that number
-- Note: format selection with gq
vim.cmd.Gl '96'
