return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local ensure = {
        "asm",
        "bash",
        "c",
        "css",
        "diff",
        "go",
        "html",
        "http",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "just",
        "latex",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "nginx",
        "norg",
        "printf",
        "python",
        "query",
        "regex",
        "rust",
        "scss",
        "sql",
        "svelte",
        "terraform",
        "toml",
        "tsx",
        "typescript",
        "typst",
        "vim",
        "vimdoc",
        "vue",
        "wgsl",
        "xml",
        "yaml",
      }

      -- setup river: https://github.com/grafana/tree-sitter-river
      vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = function()
          require("nvim-treesitter.parsers").river = {
            install_info = {
              url = "https://github.com/grafana/tree-sitter-river",
              branch = "main",
              queries = "queries",
            },
            filetype = "river",
          }
        end,
      })
      vim.filetype.add({
        extension = {
          river = "river",
          alloy = "river",
        },
      })
      table.insert(ensure, "river")

      -- setup rhai
      vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = function()
          require("nvim-treesitter.parsers").rhai = {
            install_info = {
              url = "https://github.com/elkowar/tree-sitter-rhai",
              branch = "main",
              queries = "queries",
            },
            filetype = "rhai",
          }
        end,
      })
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
        vim.api.nvim_create_autocmd("User", {
          pattern = "TSUpdate",
          callback = function()
            local p = require("nvim-treesitter.parsers")
            for _, lang in pairs({ "vcl", "vtc" }) do
              p[lang] = {
                install_info = {
                  path = vcl_path .. "/vendor/tree-sitter-" .. lang,
                  generate = true,
                },
                filetype = lang,
              }
            end
          end,
        })
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
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    opts = {
      move = {
        enable = true,
        keys = {
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
    },
  },
}
