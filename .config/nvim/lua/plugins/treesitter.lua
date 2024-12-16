return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      local ensure = {}

      if vim.fn.isdirectory("~/repos/personal/tree-sitter-river") == 0 then
        -- setup river: https://github.com/grafana/tree-sitter-river
        parser_config.river = {
          install_info = {
            url = "~/repos/personal/tree-sitter-river", -- local path or git repo
            files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
            -- optional entries:
            branch = "main", -- default branch in case of git repo if different from master
            generate_requires_npm = false, -- if stand-alone parser without npm dependencies
            requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
          },
          filetype = "river", -- if filetype does not match the parser name
        }
        vim.filetype.add({
          extension = {
            river = "river",
            alloy = "river",
          },
        })
        -- :TSInstall river

        table.insert(ensure, "river")
      end

      return {
        ensure_installed = ensure,

        highlight = {
          enable = true,
        },
      }
    end,
  },
}
