return {
  workspaces = {
    {
      name = 'personal',
      path = '~/repos/personal/notes',
    },
  },
  daily_notes = {
    folder = '0-daily',
    template = 'daily.md',
  },
  attachments = {
    img_folder = '6-extras/attachments',
  },
  templates = {
    folder = '6-extras/templates',
    date_format = '%Y-%m-%d',
    time_format = '%H:%M',
    substitutions = {
      yesterday = function()
        return os.date('%Y-%m-%d', os.time() - 86400)
      end,
      today = function()
        return os.date '%Y-%m-%d'
      end,
      tomorrow = function()
        return os.date('%Y-%m-%d', os.time() + 86400)
      end,

      day = function()
        return os.date '%d'
      end,
      month = function()
        return os.date '%m'
      end,
      week = function()
        return os.date '%W'
      end,
      weekday = function()
        return os.date('*t').wday
      end,
      weekdayname = function()
        local daysoftheweek =
          { 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday' }
        return daysoftheweek[os.date('*t').wday]
      end,
      year = function()
        return os.date '%Y'
      end,
    },
  },
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will be given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ''
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return tostring(os.time()) .. '-' .. suffix
  end,
}
