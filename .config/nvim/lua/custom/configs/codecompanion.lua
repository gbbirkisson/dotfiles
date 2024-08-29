return {
  config = function()
    require('codecompanion').setup {
      strategies = {
        chat = {
          adapter = vim.env.NVIM_LLM or 'openai', -- can be ollama
        },
        inline = {
          adapter = vim.env.NVIM_LLM or 'openai', -- can be ollama
        },
        agent = {
          adapter = vim.env.NVIM_LLM or 'openai', -- can be ollama
        },
      },
      adapters = {
        ollama = function()
          return require('codecompanion.adapters').extend('ollama', {
            model = 'mistral:instruct',
          })
        end,
        openai = function()
          return require('codecompanion.adapters').extend('openai', {
            env = {
              api_key = 'cmd:op read op://hemwnx22rvxga5v2zkicawq6sq/l6mbqk77zt62hrdxahozqi6uom/key --no-newline',
            },
          })
        end,
      },
    }
  end,
}
