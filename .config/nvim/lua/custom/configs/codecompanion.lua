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
      prompt_library = {
        ['Code Help'] = {
          strategy = 'chat',
          description = 'Get some help from an LLM',
          opts = {
            modes = { 'v' },
            slash_cmd = 'help',
            short_name = 'help',
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = 'system',
              opts = {
                visible = false,
              },
              content = function(context)
                return 'I want you to act as a senior '
                  .. context.filetype
                  .. ' developer. I will ask you specific questions and I want you to return codeblock examples. Include comments in the code about what what it does. Keep it short and concise!'
              end,
            },
            {
              role = 'user',
              opts = {
                contains_code = true,
              },
              content = function(context)
                local text = require('codecompanion.helpers.actions').get_code(
                  context.start_line,
                  context.end_line
                )

                return 'I have the following code:\n\n```'
                  .. context.filetype
                  .. '\n'
                  .. text
                  .. '\n```\n\n'
                  .. 'How can I ...'
              end,
            },
          },
        },
      },
    }
  end,
}
