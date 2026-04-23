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

-- Centering
map("n", "<c-u>", "<c-u>zz")
map("n", "<c-d>", "<c-d>zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- Conceal Level
map("n", "<leader>cd", "<Cmd>set conceallevel=0<CR>", { desc = "Conceal Level Disable" })
map("n", "<leader>ce", "<Cmd>set conceallevel=2<CR>", { desc = "Conceal Level Enable" })

-- Show noice message history
map("n", "<leader>m", "<Cmd>Noice<CR>", { desc = "Messages (Noice History)" })

-- Free <leader>l as an LSP prefix. LazyVim loads its own keymaps.lua before this
-- file, so a direct override here wins without needing an autocmd.
map("n", "<leader>l", "<Nop>", { desc = "+lsp" })

-- LSP info / restart (native API, works without :LspInfo/:LspRestart)
map("n", "<leader>li", "<Cmd>checkhealth vim.lsp<CR>", { desc = "LSP Info (checkhealth)" })
map("n", "<leader>lr", function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    vim.notify("No LSP clients attached to buffer", vim.log.levels.WARN)
    return
  end
  local names = {}
  for _, c in ipairs(clients) do
    names[#names + 1] = c.name
    c:stop()
  end
  vim.defer_fn(function()
    vim.cmd.edit()
    vim.notify("Restarted LSP: " .. table.concat(names, ", "))
  end, 500)
end, { desc = "LSP Restart (buffer clients)" })
map("n", "<leader>ll", function()
  vim.cmd("tabnew " .. vim.lsp.get_log_path())
end, { desc = "LSP Log" })

-- Useful formatting methods
map("v", "'", "!quotes<CR>", { desc = "Swap single and double quotes" })
map("v", '"', "!quotes<CR>", { desc = "Swap single and double quotes" })
map("v", "a", "!align<CR>", { desc = "Run align script" })

-- Other nice things
map("v", "<leader>yt", "!ytt<CR>", { desc = "Fetch youtube transcript" })

-- For vim diff mode
if vim.opt.diff:get() then
  map("n", "<leader>dn", "]c", { desc = "Vim Diff Next" })
  map("n", "<leader>dp", "[c", { desc = "Vim Diff Previous" })
  map("n", "<leader>dl", "<Cmd>diffget LOCAL<CR>", { desc = "Vim Diff Use Local" })
  map("n", "<leader>dr", "<Cmd>diffget REMOTE<CR>", { desc = "Vim Diff Use Remote" })
end
