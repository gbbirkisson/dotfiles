local M = {}

M.abc = {
  n = {
    -- Close buffer
    ["<c-q>"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    -- Format
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format()
      end,
      "[F]or[m]at File"
    },
    -- Emojis
    ["<leader>em"] = { "<cmd> :Telescope emoji <CR>", "[E]moji [S]elect" },
    ["<leader>ep"] = { '"*p', "[E]moji [P]aste" },
    -- Cheat sheets
    ["<leader>cl"] = { "<cmd> :!gch <CR>", "[C]eatsheet for [G]love" },
    ["<leader>ct"] = { "<cmd> :!tch <CR>", "[C]eatsheet for [T]mux" },
    -- Include hidden files, but not the ones ignored by git
    ["<leader>ff"] = { "<cmd> Telescope find_files hidden=true <CR>", "[F]ind [F]iles" },
    ["<leader>dc"] = { "<cmd> :set conceallevel=0 <CR>", "[D]isable [C]onceal Level" },
    -- Obsidian
    ["<leader>oo"] = { "<cmd> :ObsidianOpen <CR>", "[O]pen in [O]bsidian" },
    ["<leader>on"] = { ":ObsidianNew ", "[O]bsidian [N]ew" },
    ["<leader>ot"] = { ":ObsidianTags ", "[O]bsidian [T]ags" },
    -- Other
    ["<leader>gg"] = { "<cmd> :LazyGit <CR>", "Open Lazy[g]it" },
    ["<leader>cg"] = { "<cmd> :ChatGPT <CR>", "Open [C]hat[G]PT" },
  },
  v = {
    ["'"] = { ":!quotes<CR>", "Swap single and double quotes" },
    ["\""] = { ":!quotes<CR>", "Swap single and double quotes" },
    ["t"] = { ":!title<CR>", "Change to title case" },
  }
}

-- For vim diff mode
if vim.opt.diff:get() then
  local d = {
    ["<leader>dn"] = { "]c", "Vim [D]iff [N]ext" },
    ["<leader>dp"] = { "[c", "Vim [D]iff [P]revious" },
    ["<leader>dl"] = { "<cmd> :diffget LOCAL <CR>", "Vim [D]iff Use [L]ocal" },
    ["<leader>dr"] = { "<cmd> :diffget REMOTE <CR>", "Vim [D]iff Use [R]remote" },
  }
  for k, v in pairs(d) do M.abc.n[k] = v end
end

return M
