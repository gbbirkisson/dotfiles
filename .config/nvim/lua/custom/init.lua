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

-- Open nvim tree on certain conditions
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  desc = 'Open NvimTree on startup',
  callback = function(data)
    -- If a command was passed, do not open the tree
    if vim.v.argv then
      -- Loop through the arguments to check for "-c" or "--cmd"
      for _, arg in ipairs(vim.v.argv) do
        if arg == '-c' or arg == '--cmd' then
          return
        end
      end
    end

    -- buffer is a real file on the disk
    local real_file = vim.fn.filereadable(data.file) == 1

    -- buffer is a [No Name]
    local no_name = data.file == '' and vim.bo[data.buf].buftype == ''

    -- check if the data.file is a directory
    local is_directory = vim.fn.isdirectory(data.file) == 1

    -- If nvim opened a specific file, do not open tree
    if (not is_directory or real_file) and not no_name then
      return
    end

    -- open the tree, find the file but don't focus it
    require('nvim-tree.api').tree.toggle { focus = false, find_file = true }
  end,
})

-- Close no name buffer
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  desc = 'Close no name buffer when LLM chatting',
  callback = function()
    if vim.v.argv then
      for _, arg in ipairs(vim.v.argv) do
        if vim.startswith(arg, ':CodeCompanion') then
          vim.cmd '1wincmd c'
        end
      end
    end
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

-- Add command to inject jsonschema
vim.api.nvim_create_user_command('Is', function(opts)
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))

  -- Get the full path of the current buffer
  local filepath = vim.api.nvim_buf_get_name(0)

  -- Extract the filename from the path
  local filename_with_extension = vim.fn.fnamemodify(filepath, ':t')

  -- Remove the extension
  local filename_without_extension = filename_with_extension:match '(.+)%..+'

  local schema = '# yaml-language-server: $schema='
  if string.find(filename_without_extension, 'deployment') then
    schema = schema
      .. 'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.28.1-standalone-strict/deployment-apps-v1.json'
  elseif string.find(filename_without_extension, 'service') then
    schema = schema
      .. 'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.28.1-standalone-strict/service-v1.json'
  end

  vim.api.nvim_buf_set_text(0, row - 1, 0, row - 1, 0, { schema })
end, { nargs = 0 })

-- Move mason path to the back
local mason_path = vim.fn.stdpath 'data' .. '/mason/bin'
vim.env.PATH = vim.env.PATH:gsub(mason_path .. ':', '')
vim.env.PATH = vim.env.PATH .. ':' .. mason_path
