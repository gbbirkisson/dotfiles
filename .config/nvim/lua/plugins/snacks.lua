return {
  {
    "folke/snacks.nvim",
    keys = {
      { "gh", function() Snacks.gitbrowse() end, mode = { "n", "v" }, desc = "Git Browse" },
      { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame (Line)" },
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit File History" },
      { "<leader>z", function() Snacks.zen() end, desc = "Zen Mode" },
      { "<leader>Z", function() Snacks.zen.zoom() end, desc = "Zoom" },
      {
        "<leader>ud",
        function()
          if Snacks.dim.enabled then
            Snacks.dim.disable()
          else
            Snacks.dim.enable()
          end
        end,
        desc = "Toggle Dim",
      },
      {
        "<leader>ui",
        function()
          local enabled = not Snacks.image.config.enabled
          Snacks.image.config.enabled = enabled
          if enabled then
            -- re-attach current buffer so images show again
            local buf = vim.api.nvim_get_current_buf()
            vim.b[buf].snacks_image_attached = nil
            pcall(Snacks.image.doc.attach, buf)
          else
            -- clear all existing image placements and reset attach flags
            Snacks.image.placement.clean()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if vim.api.nvim_buf_is_valid(buf) then
                vim.b[buf].snacks_image_attached = nil
              end
            end
          end
          vim.notify(("Snacks images: %s"):format(enabled and "on" or "off"))
        end,
        desc = "Toggle Images",
      },
    },
    opts = {
      scroll = {
        enabled = false,
      },
      dim = {},
      image = {
        enabled = true,
      },
      zen = {
        on_open = function()
          vim.cmd("set nu!")
          vim.cmd("set colorcolumn=")
          vim.b.completion = false
        end,
        on_close = function()
          vim.cmd("set nu")
          vim.b.completion = nil
          vim.cmd("Gl 96")
        end,
      },
      styles = {
        zen = {
          width = 98,
        },
      },
      dashboard = {
        enabled = true,
        preset = {
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
          keys = {
            { icon = " ", key = "f", desc = "Find File",        action = ":lua require('telescope.builtin').find_files({ hidden = true })" },
            { icon = " ", key = "w", desc = "Find Word",        action = ":lua require('telescope.builtin').live_grep()" },
            { icon = " ", key = "n", desc = "New File",         action = ":ene | startinsert" },
            { icon = " ", key = "c", desc = "Config",           action = ":lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })" },
            { icon = " ", key = "s", desc = "Restore Session",  action = ":lua require('persistence').load()" },
            { icon = " ", key = "q", desc = "Quit",             action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
