local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

-- setup river: https://github.com/grafana/tree-sitter-river
parser_config.river = {
  install_info = {
    url = '~/repos/personal/tree-sitter-river', -- local path or git repo
    files = { 'src/parser.c' }, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = 'main', -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
  },
  filetype = 'river', -- if filetype does not match the parser name
}
vim.filetype.add {
  extension = {
    river = 'river',
    alloy = 'river',
  },
}
-- not installed automatically, run:
-- :TSInstall river

-- setup vcl: https://github.com/M4R7iNP/varnishls
for _, lang in pairs { 'vcl', 'vtc' } do
  parser_config[lang] = {
    install_info = {
      url = '~/repos/personal/varnishls/vendor/tree-sitter-' .. lang,
      files = { 'src/parser.c' },
    },
  }
end
vim.filetype.add {
  extension = {
    vcl = 'vcl',
    vtc = 'vtc',
  },
}
-- not installed automatically, run:
-- :TSInstallFromGrammar vcl
-- :TSInstallFromGrammar vtc

return {
  ensure_installed = {
    -- defaults
    'vim',
    'lua',

    -- languages
    'python',
    'rust',
    'typescript',
    'bash',
    'fish',
    'go',
    'asm',
    'sql',
    'c',
    'cpp',

    -- markdown
    'markdown',
    'markdown_inline',

    -- other,
    'json',
    'yaml',
    'markdown',
    'terraform',
    'make',
    'proto', -- protobuffers
    'html',
  },
}
