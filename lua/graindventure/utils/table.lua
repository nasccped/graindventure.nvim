local M = {}

--- Deep copies an entire table into a new one.
--- @param t table
--- @return table
M.deep_copy = function(t)
  local new_table = {}
  for k, v in pairs(t) do
    if type(v) == "table" then
      new_table[k] = M.deep_copy(v)
    else
      new_table[k] = v
    end
  end
  return new_table
end

return M
