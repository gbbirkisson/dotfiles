local cmp = require 'cmp'
local luasnip = require 'luasnip'

local defaults = require 'plugins.configs.cmp'

defaults.mapping = {
  -- Select the [n]ext item
  ['<C-n>'] = cmp.mapping.select_next_item(),
  -- Select the [p]revious item
  ['<C-p>'] = cmp.mapping.select_prev_item(),

  -- Accept ([y]es) the completion.
  --  This will auto-import if your LSP supports it.
  --  This will expand snippets if the LSP sent a snippet.
  ['<C-y>'] = cmp.mapping.confirm { select = true },
  -- ['<CR>'] = cmp.mapping.confirm {
  --   behavior = cmp.ConfirmBehavior.Insert,
  --   select = true,
  -- },

  -- Think of <c-l> as moving to the right of your snippet expansion.
  --  So if you have a snippet that's like:
  --  function $name($args)
  --    $body
  --  end
  --
  -- <c-l> will move you to the right of each of the expansion locations.
  -- <c-h> is similar, except moving you backwards.
  ['<C-l>'] = cmp.mapping(function()
    if luasnip.expand_or_locally_jumpable() then
      luasnip.expand_or_jump()
    end
  end, { 'i', 's' }),
  ['<C-h>'] = cmp.mapping(function()
    if luasnip.locally_jumpable(-1) then
      luasnip.jump(-1)
    end
  end, { 'i', 's' }),

  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-e>'] = cmp.mapping.close(),
}

return defaults
