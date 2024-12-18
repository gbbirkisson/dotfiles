-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use treesitter instead of semantic tokens
-- :h vim.highlight.priorities
vim.highlight.priorities.semantic_tokens = 95

-- Do not use relative numbers
vim.wo.relativenumber = false

-- Enable break indent
vim.opt.breakindent = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Add function to set colorcolumn and textwidth
vim.api.nvim_create_user_command("Gl", function(opts)
  vim.api.nvim_set_option_value("colorcolumn", opts.fargs[1], {})
  vim.api.nvim_set_option_value("textwidth", tonumber(opts.fargs[1]), {})
end, { nargs = 1 })

-- Default to 96, because github diff view looks nice with that number
-- Note: format selection with gq
vim.cmd.Gl("96")