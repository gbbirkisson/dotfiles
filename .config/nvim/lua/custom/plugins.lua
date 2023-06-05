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
    -- Configure live grep
    "nvim-telescope/telescope.nvim",
    opts = {
        defaults = {
          vimgrep_arguments = {
            -- defaults
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",

            -- include hidden files (except .git)
            "-.",
            "--glob=!.git/",

            -- Exclude lock files
            "--glob=!*.lock",
          },
      },
    },
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

        -- other,
        "yaml",
        "markdown",
        "terraform",
      }
    }
  },
  {
    -- LSP extensions
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python", "rust", "yaml"},
    opts = function ()
      return require("custom.configs.null-ls")
    end
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
    cmd = { "GenTocGFM" }
  },
  {
    -- LazyGit
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit" },
  },
}

return plugins
