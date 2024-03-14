return {
  {
    "nvim-telescope/telescope.nvim",
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
      extensions_list = { "themes", "terms", "emoji" },
      extensions = {
        emoji = {
          action = function(emoji)
            -- argument emoji is a table.
            -- {name="", value="", cagegory="", description=""}

            -- vim.fn.setreg("*", emoji.value)
            -- print([[Press p or "*p to paste this emoji]] .. emoji.value)

            -- insert emoji when picked
            vim.api.nvim_put({ emoji.value }, 'c', false, true)
          end,
        },
      }
    },
    dependencies = {
      "xiyaowong/telescope-emoji.nvim",
    },
  },
}
