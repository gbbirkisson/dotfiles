return {
  "kylechui/nvim-surround",
  laxy = false,
  opts = {
    keymaps = {
      insert = "<C-g>s",
      insert_line = "<C-g>S",
      normal = "yt",
      normal_cur = "ytt",
      normal_line = "yT",
      normal_cur_line = "yTT",
      visual = "T",
      visual_line = "gT",
      delete = "dt",
      change = "ct",
      change_line = "cT",
    },
  },
}
