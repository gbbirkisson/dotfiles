return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "xiyaowong/telescope-emoji.nvim",
    },
    keys = {
      { "<leader>fw", "<Cmd>Telescope live_grep<CR>", desc = "Find Word" },
      { "<leader>fe", "<Cmd>Telescope emoji<CR>", desc = "Find Emoji" },
      { "<leader>ff", "<Cmd>Telescope find_files hidden=true<CR>", desc = "Find Files" },
      { "<leader>ft", "<Cmd>TodoTelescope keywords=TODO,FIX<CR>", desc = "Find Todo" },
      { "<leader>fn", "<Cmd>TodoTelescope<CR>", desc = "Find Notes" },
      { "<leader>fh", "<Cmd>Telescope help_tags<CR>", desc = "Find Help" },
      { "<leader>fk", "<Cmd>Telescope keymaps<CR>", desc = "Find Keymaps" },
      { "<leader>fc", "<Cmd>Telescope grep_string<CR>", desc = "Find Current Word" },
      { "<leader>fd", "<Cmd>Telescope diagnostics<CR>", desc = "Find Diagnostics" },
      { "<leader>fr", "<Cmd>Telescope resume<CR>", desc = "Find Resume" },
      {
        "<leader>f;",
        function()
          require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Find Config",
      },
    },
    opts = {
      defaults = {
        vimgrep_arguments = {
          -- defaults
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",

          -- include hidden files (except .git)
          "-.",

          -- Exclude lock files
          "--glob=!*.lock",
        },
        file_ignore_patterns = {
          ".git/",
          "node_modules",
          ".venv",
          "__pycache__",
          ".mypy_cache",
          ".pytest_cache",
          ".ruff_cache",
          ".next",
        },
      },
      extensions_list = { "emoji" },
      extensions = {
        emoji = {
          action = function(emoji)
            -- insert emoji when picked
            vim.api.nvim_put({ emoji.value }, "c", false, true)
          end,
        },
      },
    },
  },
}
