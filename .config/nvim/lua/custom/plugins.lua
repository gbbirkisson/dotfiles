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

        -- Go
        "gopls",

        -- YAML
        "yaml-language-server",
        "yamllint",
        "yamlfmt",

        -- Toml
        "taplo",

        -- Lua
        "lua-language-server",

        -- Javascript / Typescript
        "typescript-language-server",

        -- C / C++
        "clangd",

        -- Bash
        "bash-language-server",
        "shfmt",

        -- Markdown
        "marksman",

        -- Other
        "typos",
        "tree-sitter-cli",
      }
    },
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
    opts = function ()
      return require("custom.configs.none-ls")
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
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "op read op://y46glakwqtek75fxiejq6is3qa/qnpgz2gbdyqdcp4cnrobbzttfm/key --no-newline",
        edit_with_instructions = {
          keymaps = {
            use_output_as_input = "<M-y>",
          },
        },
        openai_params = {
         model = "gpt-4",
        },
        openai_edit_params = {
         model = "gpt-4",
        },
      })
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
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
        vim.cmd("set nu!")

        -- Disable colorcolumn
        vim.cmd("set colorcolumn=")

        -- Disable autocomplete
        require('cmp').setup.buffer { enabled = false }
      end,
      on_close = function()
        -- Enable line numbers
        vim.cmd("set nu")

        -- Enable autocomplete
        require('cmp').setup.buffer { enabled = true }

        -- Enable colorcolumn
        vim.cmd("Gl 96")
      end,
    }
  },
}

return plugins
