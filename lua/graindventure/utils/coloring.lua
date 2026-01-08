local M = {}

--- @class graindventure.utils.RGBTable
--- @field r number: Red color.
--- @field g number: Green color.
--- @field b number: Blue color.

--- Converts a string into a rgb table. Panics if the string isn't an
--- acceptable hex format.
--- @param color string
--- @return graindventure.utils.RGBTable
local function into_rgb(color)
  if #color == 7 and string.sub(color, 1, 1) == "#" then
    color = string.sub(color, 2)
  end
  if #color ~= 6 then
    error("unexpected color format: " .. color)
  end
  local r, g, b = color:sub(1, 2), color:sub(3, 4), color:sub(5, 6)
  return {
    r = tonumber(r, 16),
    g = tonumber(g, 16),
    b = tonumber(b, 16)
  }
end

--- Converts common color types (like RGB) into hex string.
--- @param rgb graindventure.utils.RGBTable
--- @return string
local function into_hex(rgb)
  return string.format("#%02x%02x%02x", rgb.r, rgb.g, rgb.b)
end

--- Clamps the rgb's values.
--- @param rgb graindventure.utils.RGBTable
--- @return graindventure.utils.RGBTable
local function clamp_rgb(rgb)
  for k, v in pairs(rgb) do
    rgb[k] = math.floor(math.min(math.max(0, v), 255) + 0.5)
  end
  return rgb
end

--- Blends two RGBs into a new one by a given percentage. Percentage
--- must be a float between 0 and 1, otherwise results in an error.
--- @param rgb1 graindventure.utils.RGBTable
--- @param rgb2 graindventure.utils.RGBTable
--- @param percentage number
--- @return graindventure.utils.RGBTable
local function blend_rgb(rgb1, rgb2, percentage)
  local diff
  for k, _ in pairs(rgb1) do
    diff = rgb2[k] - rgb1[k]
    rgb1[k] = rgb1[k] + (diff * percentage)
  end
  return clamp_rgb(rgb1)
end

--- Lighten a given hex color by a given percentage.
--- @param color string
--- @param percentage number
--- @return graindventure.utils.RGBTable
local function lighten_rgb(rgb, percentage)
  local increase
  for k, v in pairs(rgb) do
    increase = (0xff - v) * percentage
    rgb[k] = v + increase
  end
  return clamp_rgb(rgb)
end

--- Blends the color 1 with color 2 by a given percentage
--- (float 0 -> 1).
--- @param c1 string color 1 (initial color).
--- @param c2 string color 2 (blend to).
--- @param percentage number how much to blend.
--- @return string
M.blend = function(c1, c2, percentage)
  return into_hex(blend_rgb(into_rgb(c1), into_rgb(c2), percentage))
end

--- Lighten a given hex color by a given percentage.
--- @param color string
--- @param percentage number
--- @return string
M.lighten = function(color, percentage)
  return into_hex(lighten_rgb(into_rgb(color), percentage))
end

return M
