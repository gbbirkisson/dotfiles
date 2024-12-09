return {
  {
    "nvchad/base46",
    lazy = false,
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
