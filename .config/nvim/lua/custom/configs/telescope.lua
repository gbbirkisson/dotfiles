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
}

return opts
