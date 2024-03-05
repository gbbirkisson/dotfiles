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
    ["<leader>ft"] = { "<cmd> :TodoTelescope keywords=TODO,FIX <CR>", "[F]ind [T]odo" },
    ["<leader>fn"] = { "<cmd> :TodoTelescope <CR>", "[F]ind [N]otes" },
    -- Conceal Level
    ["<leader>cd"] = { "<cmd> :set conceallevel=0 <CR>", "[C]onceal Level [D]isable" },
    ["<leader>ce"] = { "<cmd> :set conceallevel=2 <CR>", "[C]onceal Level [E]nable" },
    -- Obsidian
    ["<leader>oo"] = { "<cmd> :ObsidianOpen <CR>", "[O]pen in [O]bsidian" },
    ["<leader>on"] = { ":ObsidianNew ", "[O]bsidian [N]ew" },
    ["<leader>ot"] = { "<cmd> :ObsidianTags <CR>", "[O]bsidian [T]ags" },
    ["<leader>oi"] = { ":ObsidianPasteImg ", "[O]bsidian Paste [I]mage" },
    -- Other
    ["<leader>gg"] = { "<cmd> :LazyGit <CR>", "Open Lazy[g]it" },
    ["<leader>cg"] = { "<cmd> :ChatGPT <CR>", "Open [C]hat[G]PT" },
    ["<leader>gb"] = { "<cmd> :ToggleBlame <CR>", "[G]it [B]lame" },
  },
  v = {
    ["'"] = { ":!quotes<CR>", "Swap single and double quotes" },
    ["\""] = { ":!quotes<CR>", "Swap single and double quotes" },
    ["t"] = { ":!title<CR>", "Change to title case" },
    ["a"] = { ":!align<CR>", "Run align script" },
    ["s"] = { ":sort<CR>", "Sort" },
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
