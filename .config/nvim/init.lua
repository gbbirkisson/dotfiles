-- require("gbbirkisson")
require("kickstart")

-- Load common vim config
vim.cmd('source ~/.config/nvim/common.vim')

vim.keymap.set('n', '<leader>of', ':Ex<CR>', { desc = '[O]pen [F]ile' })
vim.keymap.set('n', '<m-h>', ':bp<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<m-l>', ':bn<CR>', { desc = 'Next buffer' })
