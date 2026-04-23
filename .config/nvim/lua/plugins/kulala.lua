return {
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    opts = {
      contenttypes = {
        -- Image formatters use `magick` to validate/normalize bytes.
        -- The actual image rendering is handled by the after_request hook in config().
        ["image/png"]     = { ft = "png",  formatter = { "magick", "-", "png:-" } },
        ["image/jpeg"]    = { ft = "jpeg", formatter = { "magick", "-", "jpeg:-" } },
        ["image/gif"]     = { ft = "gif",  formatter = { "magick", "-", "gif:-" } },
        ["image/webp"]    = { ft = "webp", formatter = { "magick", "-", "webp:-" } },
        ["image/avif"]    = { ft = "avif", formatter = { "magick", "-", "avif:-" } },
        ["image/svg+xml"] = { ft = "svg",  formatter = { "xmllint", "--format", "-" } },
        -- text/html, application/javascript, application/graphql use kulala's
        -- built-in prettier defaults automatically.
      },
      ui = {
        display_mode = "split", -- split | float
        split_direction = "vertical",
      },
    },
    config = function(_, opts)
      require("kulala").setup(opts)

      -- After each request, if the response is an image, copy kulala's raw-body
      -- cache file to a tempfile with the right extension and open it in a
      -- split. snacks.image has a BufReadCmd on those extensions and renders
      -- the image via the Kitty graphics protocol (Ghostty supports it).
      require("kulala.api").on("after_request", function(ctx)
        local resp = ctx and ctx.response
        if not resp or not resp.headers_tbl then return end

        local ct = resp.headers_tbl["content-type"]
        if type(ct) == "table" then ct = ct[1] end
        if type(ct) ~= "string" then return end
        ct = ct:match("^([^;]+)") or ct -- strip "; charset=..."
        local subtype = ct:match("^image/(.+)$")
        if not subtype then return end

        -- svg is XML text, let snacks.image handle it separately via its
        -- convert path if you enable it; for now just skip the auto-open.
        if subtype:match("svg") then return end

        local ext = (subtype:match("^(%w+)") or "bin"):lower()
        local src = require("kulala.globals").BODY_FILE
        local dest = vim.fn.tempname() .. "." .. ext

        local ok = pcall(vim.uv.fs_copyfile, src, dest)
        if not ok then return end

        vim.schedule(function()
          -- Split the image below kulala's response pane (right column) instead
          -- of full-width bottom. Fall back to bottom-split if the pane isn't open.
          local kulala_buf = vim.fn.bufnr("kulala://ui")
          local target_win
          if kulala_buf ~= -1 then
            for _, w in ipairs(vim.api.nvim_list_wins()) do
              if vim.api.nvim_win_get_buf(w) == kulala_buf then
                target_win = w
                break
              end
            end
          end
          if target_win then
            vim.api.nvim_set_current_win(target_win)
            vim.cmd("belowright split " .. vim.fn.fnameescape(dest))
          else
            vim.cmd("botright split " .. vim.fn.fnameescape(dest))
          end

          local buf = vim.api.nvim_get_current_buf()
          vim.bo[buf].buftype = "nofile" -- not a real file buffer, suppresses save prompts
          vim.bo[buf].bufhidden = "wipe" -- discard on close
          vim.bo[buf].swapfile = false
          vim.bo[buf].modified = false
          vim.keymap.set("n", "q", "<Cmd>close<CR>", { buffer = buf, silent = true, desc = "Close image" })
        end)
      end)
    end,
    keys = {
      { "<leader>Rs", function() require("kulala").run() end, desc = "Send request", ft = { "http", "rest" } },
      { "<leader>Ra", function() require("kulala").run_all() end, desc = "Send all requests", ft = { "http", "rest" } },
      { "<leader>Rr", function() require("kulala").replay() end, desc = "Replay last request" },
      { "<leader>Ri", function() require("kulala").inspect() end, desc = "Inspect current request", ft = { "http", "rest" } },
      { "<leader>Rb", function() require("kulala").scratchpad() end, desc = "Open scratchpad" },
      { "<leader>Rc", function() require("kulala").copy() end, desc = "Copy as cURL", ft = { "http", "rest" } },
      { "<leader>Rf", function() require("kulala").from_curl() end, desc = "Paste from cURL" },
      { "<leader>Rt", function() require("kulala").toggle_view() end, desc = "Toggle headers/body view" },
      { "<leader>Rn", function() require("kulala").jump_next() end, desc = "Next request", ft = { "http", "rest" } },
      { "<leader>Rp", function() require("kulala").jump_prev() end, desc = "Prev request", ft = { "http", "rest" } },
      { "<leader>Re", function() require("kulala").set_selected_env() end, desc = "Select Env" },
    },
  },
}
