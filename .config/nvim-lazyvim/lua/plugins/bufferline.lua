return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<A-l>", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
      { "<A-h>", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev Buffer" },
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
      { "<C-q>", "<Cmd>bd<CR>", desc = "Close Buffer" },
      { "<C-q>", "<Cmd>bd<CR>", desc = "Close Buffer" },
      { "<leader><leader>", "<c-^>", desc = "Rotate Buffer" },
    },
  },
}
