return {
  {
    -- Git blame
    "FabijanZulj/blame.nvim",
    cmd = { "BlameToggle" },
    keys = {
      { "<leader>gb", "<Cmd>BlameToggle<CR>", desc = "Git Blame" },
    },
    opts = {
      merge_consecutive = true,
      date_format = "%Y.%m.%d",
      max_summary_width = 30,
      colors = {
        "#e07c75",
        "#d19a66",
        "#e5c07b",
        "#98c379",
        "#61afef",
        "#c678dd",
        "#c8ccd4",
      },
    },
  },
}
