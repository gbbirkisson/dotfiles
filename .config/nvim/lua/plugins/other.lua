return {
  { -- Set project workspace
    'ahmedkhalf/project.nvim',
    lazy = false,
    config = function()
      require('project_nvim').setup {
        detection_methods = {
          'pattern',
          'lsp',
        },
        patterns = {
          '.git',
          '.deploy',
          'pyproject.toml',
          'Cargo.lock',
        },
      }
    end,
  },
  { -- File tree
    'nvim-tree/nvim-tree.lua',
    opts = {
      sync_root_with_cwd = true,
      -- respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    },
  },
  { -- Leap with s/S
    'ggandor/leap.nvim',
    keys = { 's', 'S' },
    config = function()
      local leap = require 'leap'
      leap.add_default_mappings()

      -- Disable auto jump
      leap.opts.safe_labels = {}
      leap.opts.labels = 'sfnjklhodweimbuyvrgtaqpcxzæSFNJKLHODWEIMBUYVRGTAQPCXZÆ'
    end,
  },
  { -- Collection of nice plugins
    'echasnovski/mini.nvim',
    lazy = false,
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- TODO: Conflicts with leap
      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      -- require('mini.surround').setup()
    end,
  },
  {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    lazy = false,
  },
  { -- Zen Mode
    'folke/zen-mode.nvim',
    cmd = { 'ZenMode' },
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
      on_open = function(_)
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
  },
}
