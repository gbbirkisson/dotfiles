local M = {}

M.abc = {
  n = {
    -- Interact with clipboard
    ['<leader>y'] = { '"+y' },
    ['<leader>yy'] = { '"+yy' },
    ['<leader>Y'] = { '"+Y' },
    ['<leader>p'] = { '"+p' },
    ['<leader>P'] = { '"+P' },

    -- Centering
    ['<c-u>'] = { '<c-u>zz' },
    ['<c-d>'] = { '<c-d>zz' },
    ['n'] = { 'nzz' },
    ['N'] = { 'Nzz' },

    -- Buffers
    ['<c-q>'] = {
      function()
        require('nvchad.tabufline').close_buffer()
      end,
      'Close buffer',
    },
    ['<leader><leader>'] = { '<c-^>', 'Buffer Rotate' },

    -- Search
    ['<leader>fe'] = { '<cmd> :Telescope emoji <CR>', '[F]ind [E]moji' },
    ['<leader>ff'] = { '<cmd> :Telescope find_files hidden=true <CR>', '[F]ind [F]iles' },
    ['<leader>ft'] = { '<cmd> :TodoTelescope keywords=TODO,FIX <CR>', '[F]ind [T]odo' },
    ['<leader>fn'] = { '<cmd> :TodoTelescope <CR>', '[F]ind [N]otes' },
    ['<leader>fh'] = { '<cmd> :Telescope help_tags <CR>', '[F]ind [H]elp' },
    ['<leader>fk'] = { '<cmd> :Telescope keymaps <CR>', '[F]ind [K]eymaps' },
    ['<leader>fc'] = { '<cmd> :Telescope grep_string <CR>', '[F]ind [C]urrent Word' },
    ['<leader>fd'] = { '<cmd> :Telescope diagnostics <CR>', '[F]ind [D]iagnostics' },
    ['<leader>fr'] = { '<cmd> :Telescope resume <CR>', '[F]ind [R]esume' },
    ['<leader>fæ'] = {
      function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
      end,
      '[F]ind Neovim Config',
    },

    -- Cheat sheets
    ['<leader>cl'] = { '<cmd> :!gch <CR>', '[C]eatsheet for [G]love' },
    ['<leader>ct'] = { '<cmd> :!tch <CR>', '[C]eatsheet for [T]mux' },

    -- Conceal Level
    ['<leader>cd'] = { '<cmd> :set conceallevel=0 <CR>', '[C]onceal Level [D]isable' },
    ['<leader>ce'] = { '<cmd> :set conceallevel=2 <CR>', '[C]onceal Level [E]nable' },

    -- Obsidian
    ['<leader>oo'] = { '<cmd> :ObsidianOpen <CR>', '[O]pen in [O]bsidian' },
    ['<leader>on'] = { ':ObsidianNew ', '[O]bsidian [N]ew' },
    ['<leader>ot'] = { '<cmd> :ObsidianTags <CR>', '[O]bsidian [T]ags' },
    ['<leader>oi'] = { ':ObsidianPasteImg ', '[O]bsidian Paste [I]mage' },
    ['<leader>od'] = { 'ggdG:ObsidianTemplate daily.md<CR>', '[O]bsidian Fix [D]aily' },
    ['<leader>of'] = { 'O<ESC>jo<ESC>kgwipkdd}dd', '[O]bsidian [F]ix' },

    -- LLM
    ['<leader>aa'] = { '<cmd> :CodeCompanionActions <CR>', '[A]I [A]ction' },
    ['<leader>at'] = { '<cmd> :CodeCompanionToggle <CR>', '[A]I [T]oggle Window' },

    -- Other
    ['<leader>gg'] = { '<cmd> :LazyGit <CR>', 'Open Lazy[g]it' },
    ['<leader>cg'] = { '<cmd> :ChatGPT <CR>', 'Open [C]hat[G]PT' },
    ['<leader>gb'] = { '<cmd> :ToggleBlame <CR>', '[G]it [B]lame' },

    -- Formatting
    ['<leader>df'] = {
      function()
        vim.b.disable_autoformat = true
      end,
      '[D]isable [F]ormatting',
    },
  },

  v = {
    -- Interact with clipboard
    ['<leader>y'] = { '"+y' },
    ['<leader>p'] = { '"+p' },
    ['<leader>P'] = { '"+P' },

    -- LLM
    ['<leader>aa'] = { '<cmd> :CodeCompanionActions <CR>', '[A]I [A]ction' },
    ['<leader>at'] = { '<cmd> :CodeCompanionToggle <CR>', '[A]I [T]oggle Window' },
    ['<leader>ah'] = { '<cmd> :CodeCompanion /help <CR>', '[A]I [H]elp' },
    ['ga'] = {
      '<cmd> :CodeCompanionAdd <CR>',
      'AI add visually selected chat to the current chat buffer',
    },

    -- Useful formatting methods
    ["'"] = { ':!quotes<CR>', 'Swap single and double quotes' },
    ['"'] = { ':!quotes<CR>', 'Swap single and double quotes' },
    -- ['t'] = { ':!title<CR>', 'Change to title case' },
    ['a'] = { ':!align<CR>', 'Run align script' },
    ['s'] = { ':sort<CR>', 'Sort' },
  },
}

-- For vim diff mode
if vim.opt.diff:get() then
  local diff_mappings = {
    ['<leader>dn'] = { ']c', 'Vim [D]iff [N]ext' },
    ['<leader>dp'] = { '[c', 'Vim [D]iff [P]revious' },
    ['<leader>dl'] = { '<cmd> :diffget LOCAL <CR>', 'Vim [D]iff Use [L]ocal' },
    ['<leader>dr'] = { '<cmd> :diffget REMOTE <CR>', 'Vim [D]iff Use [R]remote' },
  }

  for k, v in pairs(diff_mappings) do
    M.abc.n[k] = v
  end
end

return M
