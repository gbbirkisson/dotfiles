require 'nvchad.mappings'

local map = function(mode, key, cmd, desc)
  vim.keymap.set(mode, key, cmd, { desc = desc })
end

-- Close buffer
map('n', '<c-q>', function()
  require('nvchad.tabufline').close_buffer()
end, 'Close buffer')

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
map('n', '<Esc>', '<cmd>nohlsearch<CR>', 'Clear search')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, 'Go to previous [D]iagnostic message')
map('n', ']d', vim.diagnostic.goto_next, 'Go to next [D]iagnostic message')
map('n', '<leader>e', vim.diagnostic.open_float, 'Show diagnostic [E]rror messages')
map('n', '<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')

-- Disable arrow keys in normal mode
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
map('n', '<C-h>', '<C-w><C-h>', 'Move focus to the left window')
map('n', '<C-l>', '<C-w><C-l>', 'Move focus to the right window')
map('n', '<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
map('n', '<C-k>', '<C-w><C-k>', 'Move focus to the upper window')

-- Center cursor when jumping up and down
map('n', '<C-u>', '<C-u>zz', 'Jump with cursor up and center')
map('n', '<C-d>', '<C-d>zz', 'Jump with cursor down and center')
map('n', 'n', 'nzz', 'Next search result and center')
map('n', 'N', 'Nzz', 'Prev search result and center')

-- Rotate between files with <leader><leader>
map('n', '<leader><leader>', '<c-^>', 'Rotate between buffers')

-- Open NvimTree
map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', 'Nvimtree Toggle window')

-- Cheat sheets
map('n', '<leader>cl', '<cmd> :!gch <CR>', '[C]eatsheet for [G]love')
map('n', '<leader>ct', '<cmd> :!tch <CR>', '[C]eatsheet for [T]mux')

-- Conceal Level
map('n', '<leader>cd', '<cmd> :set conceallevel=0 <CR>', '[C]onceal Level [D]isable')
map('n', '<leader>ce', '<cmd> :set conceallevel=2 <CR>', '[C]onceal Level [E]nable')

-- Obsidian
map('n', '<leader>oo', '<cmd> :ObsidianOpen <CR>', '[O]pen in [O]bsidian')
map('n', '<leader>on', ':ObsidianNew ', '[O]bsidian [N]ew')
map('n', '<leader>ot', '<cmd> :ObsidianTags <CR>', '[O]bsidian [T]ags')
map('n', '<leader>oi', ':ObsidianPasteImg ', '[O]bsidian Paste [I]mage')

-- Other
map('n', '<leader>gg', '<cmd> :LazyGit <CR>', 'Open Lazy[g]it')
map('n', '<leader>cg', '<cmd> :ChatGPT <CR>', 'Open [C]hat[G]PT')
map('n', '<leader>gb', '<cmd> :ToggleBlame <CR>', '[G]it [B]lame')

-- Format file
map('n', '<leader>fm', function()
  require('conform').format()
  require('conform').format { bufnr = vim.api.nvim_get_current_buf() }
end, '[F]or[m]at File')

local builtin = require 'telescope.builtin'

map('n', '<leader>ff', '<cmd> Telescope find_files hidden=true <CR>', '[F]ind [F]iles')
map('n', '<leader>ft', '<cmd> :TodoTelescope keywords=TODO,FIX <CR>', '[F]ind [T]odo')
map('n', '<leader>fn', '<cmd> :TodoTelescope <CR>', '[F]ind [N]otes')

map('n', '<leader>fh', builtin.help_tags, '[F]ind [H]elp')
map('n', '<leader>fk', builtin.keymaps, '[f]ind [K]eymaps')
-- map('n', '<leader>ff', builtin.find_files, '[S]earch [F]iles')
-- map('n', '<leader>ss', builtin.builtin, '[S]earch [S]elect Telescope')
-- map('n', '<leader>sw', builtin.grep_string, '[S]earch current [W]ord')
-- map('n', '<leader>sg', builtin.live_grep, '[S]earch by [G]rep')
-- map('n', '<leader>sd', builtin.diagnostics, '[S]earch [D]iagnostics')
-- map('n', '<leader>sr', builtin.resume, '[S]earch [R]esume')
-- map('n', '<leader>s.', builtin.oldfiles, '[S]earch Recent Files ("." for repeat)')
-- map('n', '<leader>sb', builtin.buffers, '[ ] Find existing buffers')
map('n', '<leader>fe', '<cmd> :Telescope emoji <CR>', '[F]ind [E]moji')

-- Slightly advanced example of overriding default behavior and theme
-- map('n', '<leader>/', function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, '[/] Fuzzily search in current buffer')

-- Also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
-- map('n', '<leader>s/', function()
--   builtin.live_grep {
--     grep_open_files = true,
--     prompt_title = 'Live Grep in Open Files',
--   }
-- end, '[S]earch [/] in Open Files')

-- Shortcut for searching your neovim configuration files
map('n', '<leader>fn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, '[F]ind [N]eovim files')

-- Visual mode
map('v', "'", ':!quotes<CR>', 'Swap single and double quotes')
map('v', '"', ':!quotes<CR>', 'Swap single and double quotes')
map('v', 't', ':!title<CR>', 'Change to title case')
map('v', 'a', ':!align<CR>', 'Run align script')
map('v', 's', ':sort<CR>', 'Sort')
