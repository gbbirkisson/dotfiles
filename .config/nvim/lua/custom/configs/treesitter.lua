local M = {
  opts = {
    ensure_installed = {
      -- defaults
      "vim",
      "lua",

      -- languages
      "python",
      "rust",
      "typescript",
      "bash",
      "go",
      "asm",
      "sql",

      -- other,
      "yaml",
      "markdown",
      "terraform",
      "make",
      "proto", -- protobuffers
      "river",
    }
  },
  config = function(_, opts)
    -- Standard setup
    dofile(vim.g.base46_cache .. "syntax")
    require("nvim-treesitter.configs").setup(opts)

    -- Add river parser
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.river = {
      install_info = {
        url = "https://github.com/grafana/tree-sitter-river", -- local path or git repo
        files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
        -- optional entries:
        branch = "main", -- default branch in case of git repo if different from master
        generate_requires_npm = false, -- if stand-alone parser without npm dependencies
        requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
      },
    }

    parser_config.asm = {
        install_info = {
            url = 'https://github.com/rush-rs/tree-sitter-asm.git',
            files = { 'src/parser.c' },
            branch = 'main',
        },
    }
  end,
}

-- Add river filetype
vim.filetype.add({
  extension = {
    river = 'river'
  },
})

return M
