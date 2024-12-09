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
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "default",
    },
  },
}
