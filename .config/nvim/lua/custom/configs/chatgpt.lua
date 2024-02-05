return {
  config = function()
    require("chatgpt").setup({
      api_key_cmd = "op read op://y46glakwqtek75fxiejq6is3qa/qnpgz2gbdyqdcp4cnrobbzttfm/key --no-newline",
      edit_with_instructions = {
        keymaps = {
          use_output_as_input = "<M-y>",
        },
      },
      openai_params = {
        model = "gpt-4",
      },
      openai_edit_params = {
        model = "gpt-4",
      },
    })
  end,
};
