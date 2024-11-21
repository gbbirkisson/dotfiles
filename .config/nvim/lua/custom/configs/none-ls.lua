local builtins = require('null-ls').builtins

local opts = {
  sources = {
    -- Python
    builtins.diagnostics.mypy,

    -- YAML
    builtins.diagnostics.yamllint,

    -- Other
    builtins.diagnostics.trail_space,
  },
}

return opts
