local plugins = {
  {
    -- Set project workspace root
    "ahmedkhalf/project.nvim",
    lazy = false,
    config = function()
      require("project_nvim").setup {
        detection_methods = {
          "pattern",
          "lsp",
        },
        patterns = {
          ".git",
          ".deploy",
          "pyproject.toml",
          "Cargo.lock",
        },
      }
    end
  },
  {
    -- Play nice with ahmedkhalf/project.nvim
    "nvim-tree/nvim-tree.lua",
    opts = {
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true
      },
    }
  },
  {
    -- Configure search
    "nvim-telescope/telescope.nvim",
    opts = require("custom.configs.telescope"),
    dependencies = {
      "xiyaowong/telescope-emoji.nvim",
    },
  },
  {
    -- Leap with s/S
    "ggandor/leap.nvim",
    keys = { "s", "S" },
    config = function()
      local leap = require("leap")
      leap.add_default_mappings()

      -- Disable auto jump
      leap.opts.safe_labels = {}
      leap.opts.labels = 'sfnjklhodweimbuyvrgtaqpcxzæSFNJKLHODWEIMBUYVRGTAQPCXZÆ'
    end
  },
  {
    -- Tool installation
    "williamboman/mason.nvim",
    opts = require("custom.configs.mason").opts,
  },
  {
    -- Syntax highlighting
    "nvim-treesitter/nvim-treesitter",
    opts = require("custom.configs.treesitter").opts,
    config = require("custom.configs.treesitter").config,
  },
  {
    -- Treesitter playground
    "nvim-treesitter/playground",
    cmd = { "TSPlaygroundToggle" },
  },
  {
    -- LSP extensions
    "nvimtools/none-ls.nvim",
    lazy = false,
    opts = function()
      return require("custom.configs.none-ls")
    end
  },
  {
    -- LSP Configuration
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    -- Markdown TOC
    "mzlogin/vim-markdown-toc",
    lazy = false,
  },
  {
    -- ASM highlighting
    "rush-rs/tree-sitter-asm",
    lazy = false,
  },
  {
    -- LazyGit
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit" },
  },
  {
    -- ChatGPT
    "jackMort/ChatGPT.nvim",
    cmd = {
      "ChatGPT",
      "ChatGPTActAs",
      "ChatGPTCompleteCode",
      "ChatGPTEditWithInstructions",
      "ChatGPTRun",
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = require("custom.configs.chatgpt").config,
  },
  {
    -- ZenMode for writing
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    opts = require("custom.configs.zen-mode").opts,
  },
  {
    -- Obsidian plugin for note taking
    "epwalsh/obsidian.nvim",
    version = "*", -- use latest release instead of latest commit
    lazy = true,
    event = {
      "BufReadPre " .. vim.fn.expand "~" .. "/repos/personal/notes/**.md",
      "BufNewFile " .. vim.fn.expand "~" .. "/repos/personal/notes/**.md",
    },
    cmd = { "ObsidianToday", "ObsidianCheck" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = require("custom.configs.obsidian").opts,
  },
  {
    -- Nice preview while writing markdown
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    -- Git blame
    "FabijanZulj/blame.nvim",
    cmd = { "ToggleBlame" },
    opts = {
      merge_consecutive = false,
    },
  },
  {
    -- TODO highlighting
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    opts = {
      signs = false
    }
  },
}

return plugins
