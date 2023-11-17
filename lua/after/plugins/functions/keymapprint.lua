local M = {}

function M.get__mapping(mode, keys)
  if type(mode) ~= "string" then
    error("Mode must be a string")
  end

  local mode_map = vim.api.nvim_get_keymap(mode)

  -- Iterate through the table and find the matching keys
  for _, mapping in pairs(mode_map) do
    if mapping['lhs'] == keys then
      for key, value in pairs(mapping) do
        print(key .. ": " .. tostring(value))
      end
      break
    end
  end
end

return M

