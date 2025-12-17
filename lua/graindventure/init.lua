local table_utils = require("graindventure.utils.table")

local M = {
  config = require("graindventure.config")
}

--- Loads the colorscheme into the Neovim app.
M.load = function()
end

--- Apply configuration setup based on the `graindventure.ConfigTable`
--- @param config graindventure.ConfigTable
M.setup = function(config)
  -- create a new table.
  local new_table = table_utils.deep_copy(M.config)
  -- set new tables manually, since they must be replace and not extended.
  local bolds = config["bolds"]
  if bolds then
    new_table["bolds"] = bolds
  end
  local italics = config["italics"]
  if italics then
    new_table["italics"] = bolds
  end
  local transparents = config["ransparent"]
  if transparents then
    new_table["transparents"] = transparents
  end
end

return M
