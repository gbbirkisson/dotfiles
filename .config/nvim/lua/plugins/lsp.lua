return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local lspconfig = require("lspconfig")
      local lsp_configs = require("lspconfig.configs")

      lsp_configs.varnishls = {
        default_config = {
          -- Change the path to varnishls (add --debug for debug log)
          cmd = {
            "/home/gbb/repos/personal/varnishls/target/release/varnishls",
            "lsp",
            "--stdio",
          },
          filetypes = { "vcl", "vtc" },
          root_dir = lspconfig.util.root_pattern(".varnishls.toml", ".git"),
          settings = {},
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      document_highlight = { enabled = false },
      servers = {
        ["*"] = {
          -- NOTE: https://github.com/nvim-telescope/telescope.nvim/issues/2768
          keys = {
            { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", has = "definition" },
          },
        },
        zls = {},
        varnishls = {},
        clangd = {},
        bashls = {},
        gopls = {},
        html = {
          filetypes = { "html", "templ", "htmldjango" },
        },
        terraformls = {},
        jsonls = {},
        marksman = {},
        pyright = {},
        ruff_lsp = {},
        rust_analyzer = {
          mason = false,
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allfeatures = true,
              },
              check = {
                command = "clippy",
                extraArgs = {
                  "--",
                  "--no-deps",
                },
              },
            },
          },
        },
        ts_ls = {},
        typos_lsp = {
          init_options = {
            -- "Error", "Hint", "Information", "Warning"
            diagnosticSeverity = "Information",
          },
          single_file_support = true,
        },
        yamlls = {},
      },
    },
  },
}
