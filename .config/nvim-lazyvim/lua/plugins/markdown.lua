return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function(plugin)
      vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install && npm install")
    end,
    config = function()
      vim.g.mkdp_theme = "dark"
    end,
  },
}
