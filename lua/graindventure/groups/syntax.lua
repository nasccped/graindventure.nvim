--- Function that returns the neovim's syntax highlight groups. Can
--- be found by running `:help group-name`.
--- @param palette graindventure.ColorPalette
--- @param _ graindventure.ConfigTable
--- @return graindventure.GroupsData
local M = function(palette, _)
  return {
    Function = { fg = palette.red }
    -- TODO: add others...
  }
end

return M
