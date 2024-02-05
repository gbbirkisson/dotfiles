return {
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/repos/personal/notes",
      },
    },
    daily_notes = {
      folder = "daily",
      template = "daily.md"
    },
    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      substitutions = {
        yesterday = function()
          return os.date("%Y-%m-%d", os.time() - 86400)
        end,
        today = function()
          return os.date("%Y-%m-%d")
        end,
        tomorrow = function()
          return os.date("%Y-%m-%d", os.time() + 86400)
        end,

        day = function()
          return os.date("%d")
        end,
        month = function()
          return os.date("%m")
        end,
        week = function()
          return os.date("%W")
        end,
        weekday = function()
          return os.date("*t").wday
        end,
        weekdayname = function()
          local daysoftheweek = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
          return daysoftheweek[os.date("*t").wday]
        end,
        year = function()
          return os.date("%Y")
        end,
      },
    },
  }
};
