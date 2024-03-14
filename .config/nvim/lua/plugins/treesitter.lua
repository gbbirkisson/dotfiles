return {
  {
    -- Syntax highlighting
    'nvim-treesitter/nvim-treesitter',
    opts = require('configs.treesitter').opts,
    config = require('configs.treesitter').config,
  },
  {
    -- Treesitter playground
    'nvim-treesitter/playground',
    cmd = { 'TSPlaygroundToggle' },
  },
  {
    -- ASM highlighting
    'rush-rs/tree-sitter-asm',
    lazy = false,
  },
}
