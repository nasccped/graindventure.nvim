local table_utils = require("graindventure.utils.table")

--- Function that returns the neovim's syntax highlight groups. Can
--- be found by running `:help group-name`.
--- @param palette graindventure.ColorPalette
--- @param config graindventure.ConfigTable
--- @return graindventure.GroupsData
local M = function(palette, config)
  local bolds = config.bolds or {}
  local error = table_utils.contains_value(bolds, "error")
  return {
    Comment = { fg = palette.weakForeground },

    String = { fg = palette.green },
    Character = { fg = palette.green },
    Number = { fg = palette.yellow },
    Boolean = { fg = palette.yellow },
    Float = { fg = palette.yellow },

    Identifier = { fg = palette.foreground },
    Function = { fg = palette.red },

    Statement = { fg = palette.magenta },
    Conditional = { fg = palette.magenta },
    Repeat = { fg = palette.magenta },
    Label = { fg = palette.magenta },
    Operator = { fg = palette.foreground },
    Keyword = { fg = palette.red },
    Exception = { fg = palette.red },

    PreProc = { fg = palette.cyan },
    Include = "PreProc",
    Define = "PreProc",
    Macro = "Define",
    PreCondit = "PreProc",

    Type = { fg = palette.yellow },
    StorageClass = "Type",
    Structure = "Type",
    Typedef = "Type",

    Special = { fg = palette.magenta },
    SpecialChar = "Special",
    -- TODO: add Tag = ...
    Delimiter = "Special",
    SpecialComment = "Special",
    -- TODO: add Debug = ...

    Underlined = { fg = palette.blue, underline = true },

    -- TODO: add Ignore = ...

    Error = { fg = palette.red, bold = error },

    Todo = { fg = palette.background, bg = palette.cyan },

    Added = { fg = palette.green },
    Changed = { fg = palette.yellow },
    Removed = { fg = palette.red },
  }
end

return M
