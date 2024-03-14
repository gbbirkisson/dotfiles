local M = {}

M.ui = {
  theme = 'onedark',

  statusline = {
    theme = 'vscode_colored',
    overriden_modules = require("configs.statusline"),
  },
}

return M
