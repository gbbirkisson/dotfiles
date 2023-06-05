local opts = {
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
      "--glob=!.git/",

      -- Exclude lock files
      "--glob=!*.lock",
    },
    file_ignore_patterns = {
      "node_modules",
      ".git",
      ".venv",
      "__pycache__",
      ".mypy_cache",
      ".pytest_cache",
      ".ruff_cache",
      ".next",
    },
  },
}

return opts
