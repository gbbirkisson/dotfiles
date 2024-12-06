return {
  opts = {
    ensure_installed = {
      -- Python
      'isort',
      'black',
      'mypy',
      'ruff',
      'pyright',

      -- Go
      'gopls',

      -- YAML
      'yaml-language-server',
      'yamllint',
      'yamlfmt',

      -- vscode-langservers-extracted
      'json-lsp',
      'html-lsp',
      'css-lsp',
      'eslint-lsp',

      -- Toml
      'taplo',

      -- Lua
      'lua-language-server',
      'stylua',

      -- Javascript / Typescript
      'typescript-language-server',
      'prettier',

      -- C / C++
      'clangd',

      -- Bash
      'bash-language-server',
      'shfmt',

      -- Markdown
      'marksman',

      -- Other
      'typos',
      'typos-lsp',
      'tree-sitter-cli',
    },
  },
}
