local defaults = require("graindventure.groups.defaults")
local syntax = require("graindventure.groups.syntax")
local funcs = { defaults, syntax }

--- Function that returns all the groups data based on a given color
--- palette + config table.
--- @param palette graindventure.ColorPalette
--- @param config graindventure.ConfigTable
--- @return graindventure.GroupsData
local M = function(palette, config)
  local t = {}
  for _, f in ipairs(funcs) do
    for k, v in pairs(f(palette, config)) do
      t[k] = v
    end
  end
  return t
end

return M
