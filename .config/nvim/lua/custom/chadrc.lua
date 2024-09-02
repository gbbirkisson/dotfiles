---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'onedark',

  statusline = {
    theme = 'vscode_colored',
    overriden_modules = require 'custom.configs.statusline',
  },

  hl_add = {
    DiffAdd = { bg = '#1f2a17' },
    DiffDelete = { bg = '#39170b' },
    DiffChange = { bg = '#292a17' }, -- Line change
    DiffText = { bg = '#173250' }, -- Text change
  },
}

M.plugins = 'custom.plugins'
M.mappings = require 'custom.mappings'

return M
