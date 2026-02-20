return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local ensure = {
        "bash",
        "c",
        "diff",
        "go",
        "html",
        "http",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "just",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "terraform",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "wgsl",
        "xml",
        "yaml",
      }

      -- setup river: https://github.com/grafana/tree-sitter-river
      local function register_river_parser()
        local p = require("nvim-treesitter.parsers")
        p.river = {
          install_info = {
            url = "https://github.com/grafana/tree-sitter-river",
            branch = "main",
            queries = "queries",
          },
          filetype = "river",
        }
      end
      register_river_parser()
      vim.api.nvim_create_autocmd("User", { pattern = "TSUpdate", callback = register_river_parser })
      vim.filetype.add({
        extension = {
          river = "river",
          alloy = "river",
        },
      })
      table.insert(ensure, "river")

      local function register_rhai_parser()
        local p = require("nvim-treesitter.parsers")
        p.rhai = {
          install_info = {
            url = "https://github.com/elkowar/tree-sitter-rhai",
            branch = "main",
            queries = "queries",
          },
          filetype = "rhai",
        }
      end
      register_rhai_parser()
      vim.api.nvim_create_autocmd("User", { pattern = "TSUpdate", callback = register_rhai_parser })
      vim.filetype.add({
        extension = {
          rhai = "rhai",
        },
      })
      table.insert(ensure, "rhai")

      -- setup vcl/vtc: https://github.com/M4R7iNP/varnishls
      -- These parsers don't ship pre-built src/parser.c, so they can't be installed
      -- via :TSInstall. Instead, clone the repo and generate the parsers manually:
      --   git clone https://github.com/M4R7iNP/varnishls ~/repos/personal/varnishls
      --   cd ~/repos/personal/varnishls/vendor/tree-sitter-vcl && tree-sitter generate
      --   cd ~/repos/personal/varnishls/vendor/tree-sitter-vtc && tree-sitter generate
      -- Then run :TSInstall vcl and :TSInstall vtc
      local vcl_path = vim.fn.expand("~/repos/personal/varnishls")
      if vim.fn.isdirectory(vcl_path) == 1 then
        local function register_vcl_parsers()
          local p = require("nvim-treesitter.parsers")
          for _, lang in pairs({ "vcl", "vtc" }) do
            p[lang] = {
              install_info = {
                path = vcl_path .. "/vendor/tree-sitter-" .. lang,
              },
              filetype = lang,
            }
          end
        end
        register_vcl_parsers()
        vim.api.nvim_create_autocmd("User", { pattern = "TSUpdate", callback = register_vcl_parsers })
        vim.filetype.add({
          extension = {
            vcl = "vcl",
            vtc = "vtc",
          },
        })
        table.insert(ensure, "vcl")
        table.insert(ensure, "vtc")
      end

      return {
        ensure_installed = ensure,

        highlight = { enable = true },
        indent = { enable = true },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },

        textobjects = {
          move = {
            enable = true,
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = "@class.outer",
              ["]a"] = "@parameter.inner",
            },
            goto_next_end = {
              ["]F"] = "@function.outer",
              ["]C"] = "@class.outer",
              ["]A"] = "@parameter.inner",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
              ["[a"] = "@parameter.inner",
            },
            goto_previous_end = {
              ["[F"] = "@function.outer",
              ["[C"] = "@class.outer",
              ["[A"] = "@parameter.inner",
            },
          },
        },
      }
    end,
  },
}
