return {
  {
    "olimorris/codecompanion.nvim",
    cmd = {
      "CL",
      "CodeCompanion",
      "CodeCompanionChat",
      "CodeCompanionActions",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- Optional
      {
        "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
        opts = {},
      },
    },
    keys = {
      {
        "<leader>aa",
        "<Cmd>CodeCompanionActions<CR>",
        mode = { "n", "v" },
        desc = "AI Action",
      },
      {
        "<leader>as",
        "<Cmd>CodeCompanion /summarize<CR>",
        mode = { "v" },
        desc = "AI Summarize",
      },
      {
        "<leader>at",
        "<Cmd>CodeCompanionChat Toggle<CR>",
        mode = { "n", "v" },
        desc = "AI Toggle Window",
      },
      {
        "<leader>ah",
        function()
          require("codecompanion").prompt("help")
        end,
        mode = { "v" },
        desc = "AI Help",
      },
      {
        "<leader>ga",
        "<Cmd>CodeCompanionAdd<CR>",
        mode = { "v" },
        desc = "AI add visually selected chat to the current chat buffer",
      },
    },
    opts = {
      strategies = {
        chat = {
          adapter = vim.env.NVIM_LLM or "anthropic", -- can be ollama, openai, anthropic, deepseek
          slash_commands = {
            ["buffer"] = {
              opts = {
                provider = "telescope",
              },
            },
            ["file"] = {
              opts = {
                provider = "telescope",
              },
            },
            ["symbols"] = {
              opts = {
                provider = "telescope",
              },
            },
          },
        },
        inline = {
          adapter = vim.env.NVIM_LLM or "anthropic", -- can be ollama, openai, anthropic, deepseek
        },
        agent = {
          adapter = vim.env.NVIM_LLM or "anthropic", -- can be ollama, openai, anthropic, deepseek
        },
      },
      adapters = {
        opts = {
          show_defaults = false,
        },
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            model = "mistral:instruct",
          })
        end,
        openai = function()
          return require("codecompanion.adapters").extend("openai", {
            env = {
              api_key = "cmd:op read op://hemwnx22rvxga5v2zkicawq6sq/l6mbqk77zt62hrdxahozqi6uom/key --no-newline",
            },
          })
        end,
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            env = {
              api_key = "cmd:op read op://hemwnx22rvxga5v2zkicawq6sq/7epubtpoeq4rdyrpsrzqydbnqu/credential --no-newline",
            },
          })
        end,
        deepseek = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            name = "deepseek",
            env = {
              api_key = "cmd:op read op://hemwnx22rvxga5v2zkicawq6sq/q5apc3d4wqw3wbdbkh3w4mf2xm/credential --no-newline",
              url = "https://api.together.xyz",
              chat_url = "/v1/chat/completions",
            },
            schema = {
              model = {
                default = "deepseek-ai/DeepSeek-R1",
              },
            },
          })
        end,
      },
      prompt_library = {
        ["Code Help"] = {
          strategy = "chat",
          description = "Get some help from an LLM",
          opts = {
            modes = { "v" },
            slash_cmd = "help",
            short_name = "help",
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = "system",
              opts = {
                visible = false,
              },
              content = function(context)
                return "I want you to act as a senior "
                  .. context.filetype
                  .. " developer. I will ask you specific questions and I want you to return codeblock examples. Include comments in the code about what what it does. Keep it short and concise!"
              end,
            },
            {
              role = "user",
              opts = {
                contains_code = true,
              },
              content = function(context)
                local text = require("codecompanion.helpers.actions").get_code(
                  context.start_line,
                  context.end_line
                )

                return "I have the following code:\n\n```"
                  .. context.filetype
                  .. "\n"
                  .. text
                  .. "\n```\n\n"
                  .. "How can I ..."
              end,
            },
          },
        },
        ["Summarize"] = {
          strategy = "chat",
          description = "Get a summary from an LLM",
          opts = {
            modes = { "v" },
            slash_cmd = "summarize",
            short_name = "summarize",
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = "system",
              opts = {
                visible = true,
              },
              content = function(context)
                return "Can you provide a comprehensive summary of the given text? The summary "
                  .. "should cover all the key points and main ideas presented in the original "
                  .. "text, while also condensing the information into a concise and "
                  .. "easy-to-understand format. Please ensure that the summary includes "
                  .. "relevant details and examples that support the main ideas, while "
                  .. "avoiding any unnecessary information or repetition. The length of the "
                  .. "summary should be appropriate for the length and complexity of the "
                  .. "original text, providing a clear and accurate overview without omitting "
                  .. "any important information."
                  .. "\n\n"
                  .. "Make sure to output the summary in a markdown format, with appropriate "
                  .. "headings, tables and other elements that help keep the summary easy to "
                  .. "read."
                  .. "\n"
              end,
            },
            {
              role = "user",
              opts = {
                contains_code = false,
              },
              content = function(context)
                local text = require("codecompanion.helpers.actions").get_code(
                  context.start_line,
                  context.end_line
                )

                return "I have the following text:\n\n```"
                  .. text
                  .. "\n```\n\n"
                  .. "Can you summarize it for me?"
              end,
            },
          },
        },
      },
    },
  },
}
