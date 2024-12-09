-- Helper function
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

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

-- Formatting
map("n", "<leader>df", function()
  vim.b.disable_autoformat = true
end, { desc = "Disable Formatting" })

-- Conceal Level
map("n", "<leader>cd", "<Cmd>set conceallevel=0<CR>", { desc = "Conceal Level Disable" })
map("n", "<leader>ce", "<Cmd>set conceallevel=2<CR>", { desc = "Conceal Level Enable" })
