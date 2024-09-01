-- Enable break indent
vim.opt.breakindent = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  desc = 'Open NvimTree on startup',
  callback = function(data)
    -- buffer is a real file on the disk
    local real_file = vim.fn.filereadable(data.file) == 1

    -- buffer is a [No Name]
    local no_name = data.file == '' and vim.bo[data.buf].buftype == ''

    if not real_file and not no_name then
      return
    end

    -- open the tree, find the file but don't focus it
    require('nvim-tree.api').tree.toggle { focus = false, find_file = true }
  end,
})

-- Add function to set colorcolumn and textwidth
vim.api.nvim_create_user_command('Gl', function(opts)
  vim.api.nvim_set_option_value('colorcolumn', opts.fargs[1], {})
  vim.api.nvim_set_option_value('textwidth', tonumber(opts.fargs[1]), {})
end, { nargs = 1 })

-- Default to 96, because github diff view looks nice with that number
-- Note: format selection with gq
vim.cmd.Gl '96'

-- Move mason path to the back
local mason_path = vim.fn.stdpath 'data' .. '/mason/bin'
vim.env.PATH = vim.env.PATH:gsub(mason_path .. ':', '')
vim.env.PATH = vim.env.PATH .. ':' .. mason_path
