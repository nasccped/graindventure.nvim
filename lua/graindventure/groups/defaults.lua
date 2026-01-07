--- Function that returns the default neovim's highlight groups. Can
--- be found by running `:help highlight-groups`.
--- @param palette graindventure.ColorPalette
--- @param _ graindventure.ConfigTable
--- @return graindventure.GroupsData
local M = function(palette, _)
  return {
    ColorColumn = { fg = palette.none, bg = palette.strongBackground },
    Conceal = "Normal",
    CurSearch = { fg = palette.blue, bg = palette.yellow },
  }
end

return M
