local table_utils = require("graindventure.utils.table")
local palette = table_utils.deep_copy(require("graindventure.palette"))
local config_table = table_utils.deep_copy(require("graindventure.config"))
local groups = table_utils.deep_copy(require("graindventure.groups"))
local M = {
  palette = palette,
  config = config_table,
}

--- Function that apply the provided group/data.
--- @param name string: Target group.
--- @param value table: Data to be applied.
local function apply_group(name, value)
  vim.api.nvim_set_hl(0, name, value)
end

--- Loads the colorscheme into the Neovim app.
M.load = function()
  local new_palette, new_groups, ty
  -- clone + extend palette
  new_palette = table_utils.deep_copy(M.palette)
  vim.tbl_deep_extend("force", new_palette, M.config.paletteExtend)
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "graindventure"
  vim.o.termguicolors = M.config.termgui
  vim.o.background = "dark"
  new_groups = table_utils.deep_copy(groups)
  vim.tbl_deep_extend("force", new_groups, M.config.groupsExtend)
  for name, value in pairs(new_groups) do
    ty = type(value)
    if ty == "string" then
      apply_group(name, { link = value })
    elseif ty == "table" then
      apply_group(name, value)
    else
      error("unexpected value type: " .. ty)
    end
  end
end

--- Apply configuration setup based on the `graindventure.ConfigTable`
--- @param config graindventure.ConfigTable
M.setup = function(config)
  -- create a new table.
  local new_config = table_utils.deep_copy(config_table)
  vim.tbl_deep_extend("force", new_config, config)
  -- set new tables manually, since they must be replace and not extended.
  new_config.bolds = config.bolds or config_table.bolds
  new_config.italics = config.italics or config_table.italics
  new_config.transparents = config.transparents or config_table.transparents
  new_config.paletteExtend = config.paletteExtend or config_table.paletteExtend
  M.config = new_config
end

return M
