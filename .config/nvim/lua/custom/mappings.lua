local M = {}

M.abc = {
  n = {
    ["<c-q>"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    ["<leader>gg"] = {"<cmd> :LazyGit <CR>", "Open Lazy[g]it"},
  },
}

return M
