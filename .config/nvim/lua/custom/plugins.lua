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
        "rustfmt",

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

        -- other,
        "yaml",
        "markdown",
        "terraform",
        "make",
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
}

return plugins
