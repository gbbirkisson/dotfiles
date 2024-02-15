---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "onedark",

  statusline = {
    theme = "vscode_colored",
    overriden_modules = require("custom.statusline"),
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
