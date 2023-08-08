local M = {}

M.abc = {
  n = {
    ["<c-q>"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    ["<leader>gg"] = {"<cmd> :LazyGit <CR>", "Open Lazy[g]it"},
  },
  v = {
    ["'"] = {"<cmd> :s/\"/'/g <CR><ESC>", "Replace \" with '"},
    ["\""] = {"<cmd> :s/'/\"/g <CR><ESC>", "Replace ' with \""},
  }
}

-- For vim diff mode
if vim.opt.diff:get() then
  local d = {
    ["dn"] = {"]c", "Vim [D]iff [N]ext"},
    ["dp"] = {"[c", "Vim [D]iff [P]revious"},
    ["dl"] = {"<cmd> :diffget LOCAL <CR>", "Vim [D]iff Use [L]ocal"},
    ["dr"] = {"<cmd> :diffget REMOTE <CR>", "Vim [D]iff Use [R]remote"},
  }
  for k,v in pairs(d) do M.abc.n[k] = v end
end

return M
