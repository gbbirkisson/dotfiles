local config = require 'plugins.configs.lspconfig'
local on_attach = config.on_attach

-- Merge capabilities with cmp
local capabilities = vim.tbl_deep_extend(
  'force',
  config.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

local lspconfig = require 'lspconfig'
local util = require 'lspconfig/util'

-- GSP
-- require("lspconfig.configs").gsp = {
--   default_config = {
--     cmd = { "gsp" },
--     filetypes = { "lua" },
--     root_dir = util.root_pattern(".git"),
--     settings = {},
--   },
-- }
-- lspconfig.gsp.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

-- Python
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Rust
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern 'Cargo.toml',
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allfeatures = true,
      },
      check = {
        command = 'clippy',
        extraArgs = {
          '--',
          '--no-deps',
          '-W',
          'clippy::pedantic',
          '-W',
          'clippy::nursery',
          '-W',
          'clippy::unwrap_used',
          '-A',
          'clippy::missing-const-for-fn',
          '-A',
          'clippy::missing-errors-doc',
          '-A',
          'clippy::must-use-candidate',
          '-A',
          'clippy::missing-errors-doc',
          '-A',
          'clippy::needless-raw-string-hashes',
          '-A',
          'clippy::future-not-send',
        },
      },
    },
  },
}

-- Go
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern 'go.mod',
}

-- YAML
lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Javascript / Typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- C / C++
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

-- Bash
lspconfig.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Marksman
lspconfig.marksman.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Typos
lspconfig.typos_lsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    -- Custom config. Used together with any workspace config files, taking precedence for
    -- settings declared in both. Equivalent to the typos `--config` cli argument.
    -- config = '~/code/typos-lsp/crates/typos-lsp/tests/typos.toml',
    -- How typos are rendered in the editor, eg: as errors, warnings, information, or hints.
    -- Defaults to error.
    diagnosticSeverity = 'Information',
  },
  single_file_support = true,
}
