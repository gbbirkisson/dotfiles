---@type ChadrcConfig
local M = {}

local function relative_file_location()
  local curr_buf = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local path = vim.api.nvim_buf_get_name(curr_buf)
  if path == "" then
    return "Empty "
  end
  local cwd = vim.fn.getcwd()
  return path:sub(cwd:len() + 2,-1)
end

M.ui = {
  theme = "catppuccin",

  statusline = {
    theme = "vscode_colored",

    overriden_modules = function(modules)
      modules[2] = (function() -- M.fileInfo
        local icon = "󰈚 "
        local name = relative_file_location()

        if name ~= "Empty " then
          local devicons_present, devicons = pcall(require, "nvim-web-devicons")

          if devicons_present then
            local ft_icon = devicons.get_icon(name)
            icon = (ft_icon ~= nil and ft_icon) or icon
          end

          name = " " .. name .. " "
        end

        return "%#StText# " .. icon .. name
      end)()

      modules[9] = (function() -- M.cursor_position
        return "%#StText# %l:%c "
      end)()

      table.remove(modules, 13) -- M.cwd()
      table.remove(modules, 11) -- M.filetype()
      table.remove(modules, 10) -- M.file_encoding()
    end,
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
