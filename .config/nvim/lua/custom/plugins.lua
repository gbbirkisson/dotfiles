local plugins = {
  {
    -- Set project workspace root
    "ahmedkhalf/project.nvim",
    lazy = false,
    config = function ()
      require("project_nvim").setup {
        detection_methods = {
          "pattern",
          "lsp",
        },
        patterns = {
          ".git",
          ".deploy",
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
  },
  {
    -- Leap with s/S
    "ggandor/leap.nvim",
    keys = { "s", "S" },
    config = function()
     require("leap").add_default_mappings()
    end
  },
  {
    -- Tool installation
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Python
        "black",
        "mypy",
        "ruff",
        "pyright",

        -- Rust
        "rust-analyzer",

        -- Go
        "gopls",

        -- YAML
        "yaml-language-server",
        "yamllint",
      }
    },
  },
  {
    -- Syntax highlighting
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults 
        "vim",
        "lua",

        -- languages
        "python",
        "rust",
        "typescript",
        "bash",
        "go",

        -- other,
        "yaml",
        "markdown",
        "terraform",
        "make",
        "proto", -- protobuffers
      }
    }
  },
  {
    -- LSP Configuration
    "neovim/nvim-lspconfig",
    config = function ()
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
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "op read op://y46glakwqtek75fxiejq6is3qa/qnpgz2gbdyqdcp4cnrobbzttfm/key --no-newline",
      })
    end,
  },
}

return plugins
