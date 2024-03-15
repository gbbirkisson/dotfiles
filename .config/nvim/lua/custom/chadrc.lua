---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'onedark',

  statusline = {
    theme = 'vscode_colored',
    overriden_modules = require 'custom.configs.statusline',
  },
}

M.plugins = 'custom.plugins'
M.mappings = require 'custom.mappings'
return M
