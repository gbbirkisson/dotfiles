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
    build = function(plugin)
      vim.cmd(
        "!cd "
          .. plugin.dir
          .. " && cd app && npx --yes yarn install && npm install && git reset --hard HEAD"
      )
    end,
  },
}
