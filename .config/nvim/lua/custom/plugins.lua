local plugins = {
  {
    -- Set project workspace root
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
  {
    -- Play nice with ahmedkhalf/project.nvim
    'nvim-tree/nvim-tree.lua',
    opts = {
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      view = {
        width = 50,
      },
      git = {
        enable = true,
      },
      filters = {
        custom = {
          '^.git$',
        },
        git_ignored = true,
      },
    },
  },
  {
    -- Configure search
    'nvim-telescope/telescope.nvim',
    opts = require 'custom.configs.telescope',
    dependencies = {
      'xiyaowong/telescope-emoji.nvim',
    },
  },
  {
    -- Like leap, only better
    'folke/flash.nvim',
    version = 'v2.1.0',
    event = 'VeryLazy',
    opts = {
      labels = 'asdfghjklqwertyuiopzxcvbnmæð',
      label = {
        uppercase = false,
      },
      highlight = {
        backdrop = false,
      },
      modes = {
        char = {
          highlight = { backdrop = false },
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    -- Tool installation
    'williamboman/mason.nvim',
    opts = require('custom.configs.mason').opts,
  },
  {
    -- Syntax highlighting
    'nvim-treesitter/nvim-treesitter',
    opts = require 'custom.configs.treesitter',
  },
  {
    -- Treesitter playground
    'nvim-treesitter/playground',
    cmd = { 'TSPlaygroundToggle' },
  },
  {
    -- LSP extensions
    'nvimtools/none-ls.nvim',
    lazy = false,
    dependencies = {
      'nvimtools/none-ls-extras.nvim',
    },
    opts = function()
      return require 'custom.configs.none-ls'
    end,
  },
  {
    -- LSP Configuration
    'neovim/nvim-lspconfig',
    config = function()
      require 'plugins.configs.lspconfig'
      require 'custom.configs.lspconfig'
    end,
  },
  {
    -- Markdown TOC
    'mzlogin/vim-markdown-toc',
    lazy = false,
  },
  {
    -- ASM highlighting
    'rush-rs/tree-sitter-asm',
    lazy = false,
  },
  {
    -- Nginx highlighting
    'dlvandenberg/nvim-treesitter-nginx',
    lazy = false,
  },
  {
    -- LazyGit
    'kdheepak/lazygit.nvim',
    cmd = { 'LazyGit' },
  },
  {
    -- LLM
    'olimorris/codecompanion.nvim',
    version = 'v8.11.3',
    cmd = {
      'CodeCompanion',
      'CodeCompanionChat',
      'CodeCompanionActions',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- Optional
      {
        'stevearc/dressing.nvim', -- Optional: Improves the default Neovim UI
        opts = {},
      },
    },
    config = require('custom.configs.codecompanion').config,
  },
  {
    -- ZenMode for writing
    'folke/zen-mode.nvim',
    cmd = { 'ZenMode' },
    opts = require('custom.configs.zen-mode').opts,
  },
  {
    -- Obsidian plugin for note taking
    'epwalsh/obsidian.nvim',
    version = 'v3.9.0',
    lazy = true,
    event = {
      'BufReadPre ' .. vim.fn.expand '~' .. '/repos/personal/notes/**.md',
      'BufNewFile ' .. vim.fn.expand '~' .. '/repos/personal/notes/**.md',
    },
    cmd = { 'ObsidianToday', 'ObsidianCheck' },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = require 'custom.configs.obsidian',
  },
  {
    -- Nice preview while writing markdown
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  {
    -- Git blame
    'FabijanZulj/blame.nvim',
    cmd = { 'BlameToggle' },
    opts = {
      merge_consecutive = true,
      date_format = '%Y.%m.%d',
      max_summary_width = 30,
      colors = {
        '#e07c75',
        '#d19a66',
        '#e5c07b',
        '#98c379',
        '#61afef',
        '#c678dd',
        '#c8ccd4',
      },
    },
  },
  {
    -- TODO highlighting
    'folke/todo-comments.nvim',
    version = 'v1.4.0',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      signs = false,
    },
  },
  { -- Autoformat
    'stevearc/conform.nvim',
    version = 'v8.1.0',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>fm',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = 'n',
        desc = '[F]or[m]at File',
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    opts = require 'custom.configs.conform',
  },
  {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    lazy = false,
  },
  { -- Customize CMP
    'hrsh7th/nvim-cmp',
    opts = require 'custom.configs.cmp',
  },
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    version = 'v0.14.0',
    lazy = false,
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()
    end,
  },
  {
    'sindrets/diffview.nvim',
    cmd = {
      'DiffviewOpen',
      'DiffviewClose',
      'DiffviewToggleFiles',
      'DiffviewFocusFiles',
      'DiffviewRefresh',
    },
    config = function()
      require('diffview').setup {
        enhanced_diff_hl = false,
      }
    end,
  },
}

return plugins
