return {
  "mistricky/codesnap.nvim",
  build = "make build_generator",
  cmd = {
    "CodeCompanion",
    "CodeCompanionChat",
    "CodeCompanionActions",
  },
  keys = {
    {
      "<leader>cc",
      "<Esc><Cmd>CodeSnap<CR>",
      mode = "x",
      desc = "Save selected code snapshot into clipboard",
    },
  },
  opts = {
    mac_window_bar = false,
    title = "CodeSnap.nvim",
    code_font_family = "JetBrainsMono Nerd Font",
    watermark = "",
    bg_padding = 0,
    breadcrumbs_separator = " / ",
    has_breadcrumbs = true,
    has_line_number = true,
    show_workspace = false,
    min_width = 0,
  },
}
