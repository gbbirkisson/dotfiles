return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      document_highlight = { enabled = false },
      servers = {
        zls = {},
        varnishls = {
          mason = false,
          cmd = {
            "/home/gbb/repos/personal/varnishls/target/release/varnishls",
            "lsp",
            "--stdio",
          },
          filetypes = { "vcl", "vtc" },
          root_markers = { ".varnishls.toml", ".git" },
        },
        clangd = {},
        bashls = {},
        gopls = {},
        taplo = {},
        html = {
          filetypes = { "html", "templ", "htmldjango" },
        },
        terraformls = {},
        jsonls = {},
        marksman = {},
        pyright = {
          enabled = false,
        },
        ty = {},
        ruff = {},
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
        svelte = {},
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
