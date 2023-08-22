-- Common mappings with Intellij
vim.cmd("source ~/.config/nvim/lua/custom/common.vim")

-- Use terraform treesitter parser for river files
vim.filetype.add({
  extension = {
    river = 'terraform'
  },
})
