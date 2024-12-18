-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Helper function
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Do not copy when pasting over
map("v", "p", '"_dP')

-- Interact with clipboard
map("n", "<leader>y", '"+y')
map("n", "<leader>yy", '"+yy')
map("n", "<leader>Y", '"+Y')
map("n", "<leader>p", '"+p')
map("n", "<leader>P", '"+P')

map("v", "<leader>y", '"+y')
map("v", "<leader>p", '"+p')
map("v", "<leader>P", '"+P')

-- Centering
map("n", "<c-u>", "<c-u>zz")
map("n", "<c-d>", "<c-d>zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- Conceal Level
map("n", "<leader>cd", "<Cmd>set conceallevel=0<CR>", { desc = "Conceal Level Disable" })
map("n", "<leader>ce", "<Cmd>set conceallevel=2<CR>", { desc = "Conceal Level Enable" })

-- Useful formatting methods
map("v", "'", "!quotes<CR>", { desc = "Swap single and double quotes" })
map("v", '"', "!quotes<CR>", { desc = "Swap single and double quotes" })
map("v", "a", "!align<CR>", { desc = "Run align script" })

-- For vim diff mode
if vim.opt.diff:get() then
  map("n", "<leader>dn", "]c", { desc = "Vim Diff Next" })
  map("n", "<leader>dp", "[c", { desc = "Vim Diff Previous" })
  map("n", "<leader>dl", "<Cmd>diffget LOCAL<CR>", { desc = "Vim Diff Use Local" })
  map("n", "<leader>dr", "<Cmd>diffget REMOTE<CR>", { desc = "Vim Diff Use Remote" })
end