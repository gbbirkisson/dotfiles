return {
  opts = {
    window = {
      backdrop = 0.98,
      width = 98,
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false, -- disables the ruler text in the cmd line area
        showcmd = false, -- disables the command in the last line of the screen
        laststatus = 0, -- turn off the statusline in zen mode
      },
      gitsigns = { enabled = true }, -- disables git signs
      tmux = { enabled = true }, -- disables the tmux statusline
    },
    on_open = function(win)
      -- Disable line numbers
      vim.cmd 'set nu!'

      -- Disable colorcolumn
      vim.cmd 'set colorcolumn='

      -- Disable autocomplete
      require('cmp').setup.buffer { enabled = false }
    end,
    on_close = function()
      -- Enable line numbers
      vim.cmd 'set nu'

      -- Enable autocomplete
      require('cmp').setup.buffer { enabled = true }

      -- Enable colorcolumn
      vim.cmd 'Gl 96'
    end,
  },
}
