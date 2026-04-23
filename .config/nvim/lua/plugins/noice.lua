return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.routes = opts.routes or {}
      -- Send tall command output (e.g. :verbose map, :map, :registers, :ls) to a split
      -- so it's scrollable and doesn't clobber the corner popup.
      table.insert(opts.routes, {
        view = "split",
        filter = { event = "msg_show", min_height = 10 },
      })
    end,
  },
}
