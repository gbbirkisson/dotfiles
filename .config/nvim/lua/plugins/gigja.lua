local dir = "/home/gbb/repos/futurama/gigja/.dev/nvim"

return {
  dir = dir,
  name = "gigja-preview",
  enabled = vim.fn.isdirectory(dir) == 1,
  ft = { "chordpro" },
  cmd = { "GigjaPreview", "GigjaPreviewStop" },
}
