-- Only use conceallevel in obsidian notes
if vim.fn.getcwd() ~= vim.fn.expand("~/repos/personal/notes") then
  vim.opt.conceallevel = 0
end

local checkbox = {
  "^(%s*[-*+]%s+%[)([ xX])(%].*)$",
  "^(%s*%d+[.)]%s+%[)([ xX])(%].*)$",
}

vim.keymap.set({ "n", "x" }, "<C-Space>", function()
  local first, last = vim.fn.line("."), vim.fn.line("v")
  if first > last then
    first, last = last, first
  end
  for nr = first, last do
    local line = vim.fn.getline(nr)
    for _, pat in ipairs(checkbox) do
      local head, mark, tail = line:match(pat)
      if head then
        vim.fn.setline(nr, head .. (mark == " " and "x" or " ") .. tail)
        break
      end
    end
  end
end, { buffer = true, desc = "Toggle checkbox" })

local function next_item(line)
  local indent, marker, rest = line:match("^(%s*)([-*+])%s+%[[ xX]%]%s*(.*)$")
  if indent then
    return indent .. marker .. " [ ] ", rest
  end

  local num, sep
  indent, num, sep, rest = line:match("^(%s*)(%d+)([.)])%s+%[[ xX]%]%s*(.*)$")
  if indent then
    return indent .. tonumber(num) + 1 .. sep .. " [ ] ", rest
  end

  indent, marker, rest = line:match("^(%s*)([-*+])%s+(.*)$")
  if indent then
    return indent .. marker .. " ", rest
  end

  indent, num, sep, rest = line:match("^(%s*)(%d+)([.)])%s+(.*)$")
  if indent then
    return indent .. tonumber(num) + 1 .. sep .. " ", rest
  end
end

vim.keymap.set("i", "<CR>", function()
  local line = vim.fn.getline(".")
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))

  local prefix, rest
  if col >= #line then
    prefix, rest = next_item(line)
  end

  if not prefix then
    vim.api.nvim_feedkeys(vim.keycode("<CR>"), "ni", false)
    return
  end

  if rest == "" then
    vim.api.nvim_buf_set_lines(0, row - 1, row, false, { "" })
    vim.api.nvim_win_set_cursor(0, { row, 0 })
    return
  end

  vim.api.nvim_buf_set_lines(0, row, row, false, { prefix })
  vim.api.nvim_win_set_cursor(0, { row + 1, #prefix })
end, { buffer = true, desc = "Continue list" })
