return {
  "kylechui/nvim-surround",
  lazy = false,
  init = function()
    vim.g.nvim_surround_no_mappings = true
  end,
  config = function()
    require("nvim-surround").setup()
    -- Insert mode
    vim.keymap.set("i", "<C-g>s", "<Plug>(nvim-surround-insert)")
    vim.keymap.set("i", "<C-g>S", "<Plug>(nvim-surround-insert-line)")
    -- Normal mode
    vim.keymap.set("n", "yt", "<Plug>(nvim-surround-normal)")
    vim.keymap.set("n", "ytt", "<Plug>(nvim-surround-normal-cur)")
    vim.keymap.set("n", "yT", "<Plug>(nvim-surround-normal-line)")
    vim.keymap.set("n", "yTT", "<Plug>(nvim-surround-normal-cur-line)")
    vim.keymap.set("n", "dt", "<Plug>(nvim-surround-delete)")
    vim.keymap.set("n", "ct", "<Plug>(nvim-surround-change)")
    vim.keymap.set("n", "cT", "<Plug>(nvim-surround-change-line)")
    -- Visual mode
    vim.keymap.set("x", "T", "<Plug>(nvim-surround-visual)")
    vim.keymap.set("x", "gT", "<Plug>(nvim-surround-visual-line)")
  end,
}
