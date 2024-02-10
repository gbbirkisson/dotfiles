return {
    opts = {
        ensure_installed = {
            -- Python
            "black",
            "mypy",
            "ruff",
            "pyright",

            -- Go
            "gopls",

            -- YAML
            "yaml-language-server",
            "yamllint",
            "yamlfmt",

            -- Toml
            "taplo",

            -- Lua
            "lua-language-server",

            -- Javascript / Typescript
            "typescript-language-server",

            -- C / C++
            "clangd",

            -- Bash
            "bash-language-server",
            "shfmt",

            -- Markdown
            "marksman",

            -- Other
            "typos",
            "tree-sitter-cli",
        }
    },
};
