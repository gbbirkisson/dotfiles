-- Only use conceallevel in obsidian notes
if vim.fn.getcwd() ~= vim.fn.expand("~/repos/personal/notes") then
  vim.opt.conceallevel = 0
end
