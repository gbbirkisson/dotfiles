return {
  config = function()
    require('chatgpt').setup {
      api_key_cmd = 'op read op://hemwnx22rvxga5v2zkicawq6sq/l6mbqk77zt62hrdxahozqi6uom/key --no-newline',
      edit_with_instructions = {
        keymaps = {
          use_output_as_input = '<C-y>',
        },
      },
      openai_params = {
        model = 'gpt-4o',
      },
      openai_edit_params = {
        model = 'gpt-4o',
      },
    }
  end,
}
