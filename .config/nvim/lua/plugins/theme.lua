return {
  {
    "gbbirkisson/base46",
    lazy = false,
    priority = 999,
    init = function()
      vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"
    end,
    config = function()
      require("base46").load_all_highlights()

      -- Telescope
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#abb2bf" })
      vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = "#abb2bf" })

      vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = "#e06c75", bold = true })
      vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#565c64" })
      vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = "#565c64" })
      vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#565c64" })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "default",
    },
  },
}
