dofile(vim.g.base46_cache .. 'lsp')
require 'nvchad.lsp'

local defaults = require 'nvchad.configs.lspconfig'

-- Merge capabilities with cmp
local capabilities = vim.tbl_deep_extend(
  'force',
  defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- Add more stuff to on_on attach
local on_attach = function(client, bufnr)
  defaults.on_attach(client, bufnr)

  if client and client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

-- Servers to support
local servers = {
  -- clangd = {},
  -- gopls = {},
  pyright = {},
  -- tsserver = {},
  rust_analyzer = {},
  -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs

  lua_ls = {
    -- cmd = {...},
    -- filetypes { ...},
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        workspace = {
          checkThirdParty = false,
          -- Tells lua_ls where to find all the Lua files that you have loaded
          -- for your neovim configuration.
          library = {
            '${3rd}/luv/library',
            unpack(vim.api.nvim_get_runtime_file('', true)),
          },
          -- If lua_ls is really slow on your computer, you can try this instead:
          -- library = { vim.env.VIMRUNTIME },
        },
        completion = {
          callSnippet = 'Replace',
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
}

-- Setup maseon
require('mason').setup()

-- Install tools
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, require 'configs.mason')
require('mason-tool-installer').setup { ensure_installed = ensure_installed }

-- Setup LSPs
require('mason-lspconfig').setup {
  handlers = {
    function(server_name)
      local server = servers[server_name] or {}
      server.on_attach = on_attach
      server.on_init = defaults.on_init
      server.capabilities =
        vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      require('lspconfig')[server_name].setup(server)
    end,
  },
}
