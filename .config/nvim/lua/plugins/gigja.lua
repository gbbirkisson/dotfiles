local repo = "/home/gbb/repos/personal/gigja"
local dir = repo .. "/.dev/nvim"

return {
  dir = dir,
  name = "gigja-preview",
  enabled = vim.fn.isdirectory(dir) == 1,
  ft = { "chordpro" },
  cmd = { "GigjaPreview", "GigjaPreviewStop", "GigjaPaste" },
  -- exrc for this repo only: run its .nvim.lua when nvim starts inside it.
  init = function()
    local cwd = vim.uv.cwd()
    if cwd ~= repo and not vim.startswith(cwd, repo .. "/") then return end
    local code = vim.secure.read(repo .. "/.nvim.lua")
    if code then assert(loadstring(code, "@" .. repo .. "/.nvim.lua"))() end
  end,
}
