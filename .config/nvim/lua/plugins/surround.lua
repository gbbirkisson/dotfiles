return {
  "kylechui/nvim-surround",
  init = function()
    vim.g.nvim_surround_no_mappings = true
  end,
  opts = {},
  keys = {
    -- Insert mode
    { "<C-g>s", "<Plug>(nvim-surround-insert)", mode = "i" },
    { "<C-g>S", "<Plug>(nvim-surround-insert-line)", mode = "i" },
    -- Normal mode
    { "yt", "<Plug>(nvim-surround-normal)", mode = "n" },
    { "ytt", "<Plug>(nvim-surround-normal-cur)", mode = "n" },
    { "yT", "<Plug>(nvim-surround-normal-line)", mode = "n" },
    { "yTT", "<Plug>(nvim-surround-normal-cur-line)", mode = "n" },
    { "dt", "<Plug>(nvim-surround-delete)", mode = "n" },
    { "ct", "<Plug>(nvim-surround-change)", mode = "n" },
    { "cT", "<Plug>(nvim-surround-change-line)", mode = "n" },
    -- Visual mode
    { "T", "<Plug>(nvim-surround-visual)", mode = "x" },
    { "gT", "<Plug>(nvim-surround-visual-line)", mode = "x" },
  },
}
