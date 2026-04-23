return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<A-l>", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
      { "<A-h>", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
      { "<C-q>", function() Snacks.bufdelete() end, desc = "Close Buffer" },
    },
  },
}
