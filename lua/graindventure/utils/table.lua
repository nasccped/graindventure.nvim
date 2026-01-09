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

--- Returns if both tables contains the same keys/values.
--- @param t1 table
--- @param t2 table
--- @return boolean
M.equals = function(t1, t2)
  if #t1 ~= #t2 then
    return false
  end
  for k, v in pairs(t1) do
    if t2[k] ~= v then
      return false
    end
  end
  return true
end

--- Returns true if the provided table contains the value.
--- @param t table
--- @param value any
--- @return boolean
M.contains_value = function(t, value)
  for _, v in pairs(t) do
    if type(value) == "table" and M.equals(v, value) then
      return true
    elseif v == value then
      return true
    end
  end
  return false
end

--- Returns true if the provided table contains the key.
--- @param t table
--- @param key any
--- @return boolean
M.contains_key = function(t, key)
  for k, _ in pairs(t) do
    if k == key then
      return true
    end
  end
      return false
end

return M
