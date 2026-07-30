vim.opt.commentstring = "# %s"

-- Strip lyrics from the given line range, keeping only the [chords] with a
-- single space between them (empty [] dropped). Range-aware so it works on a
-- visual selection or a single line.
vim.api.nvim_buf_create_user_command(0, "ChordsOnly", function(opts)
  for i = opts.line1, opts.line2 do
    local chords = {}
    for c in vim.fn.getline(i):gmatch("%b[]") do
      if c ~= "[]" then
        chords[#chords + 1] = c
      end
    end
    vim.fn.setline(i, table.concat(chords, " "))
  end
end, { range = true, desc = "ChordPro: strip lyrics, keep chords" })

-- <leader>C: chords-only over the visual selection (or current line in normal).
-- Visual-mode `:` auto-inserts the '<,'> range.
local opts = { buffer = true, silent = true, desc = "Chords only (strip lyrics)" }
vim.keymap.set("x", "<leader>C", ":ChordsOnly<CR>", opts)
vim.keymap.set("n", "<leader>C", ":ChordsOnly<CR>", opts)
