local M = {
  filetype = {
    python = {
      require("formatter.filetypes.python").isort,
      require("formatter.filetypes.python").black,
    },
    rust = {
      require("formatter.filetypes.rust").rustfmt
    },
    sh = {
      require("formatter.filetypes.sh").shfmt
    },
    terraform = {
      require("formatter.filetypes.terraform").terraformfmt
    },
    toml = {
      require("formatter.filetypes.toml").taplo
    },
    yaml = {
      require("formatter.filetypes.yaml").yamlfmt
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

local disable_auto_format = { "yaml", "toml" }

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
