return {
  {
    "mzlogin/vim-markdown-toc",
    ft = { "markdown" },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    init = function()
      vim.g.mkdp_theme = "dark"
    end,
    build = "cd app && npm install",
  },
}
