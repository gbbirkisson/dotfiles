local M = {
  filetype = {
    rust = {
      require("formatter.filetypes.rust").rustfmt
    },
    toml = {
      require("formatter.filetypes.toml").taplo
    },
    yaml = {
      require("formatter.filetypes.yaml").yamlfmt
    },
    python = {
      require("formatter.filetypes.python").isort,
      require("formatter.filetypes.python").black,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

local disable_auto_format = { "yaml" }

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "*",
  callback = function ()
    for _, filetype in pairs(disable_auto_format) do
     if filetype == vim.bo.filetype then
        return
     end
    end
    vim.cmd("FormatWriteLock")
  end
})

return M
