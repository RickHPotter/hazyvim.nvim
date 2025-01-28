local M = {}

-- Function to toggle to snake_case
function M.snake_case()
  local word = vim.fn.expand("<cword>")
  local snake_case = string.gsub(word, "[A-Z]", function(match)
    return "_" .. string.lower(match)
  end)
  if snake_case:sub(1, 1) == "_" then
    snake_case = snake_case:sub(2)
  end
  if snake_case ~= word then
    vim.cmd("normal ciw" .. snake_case)
  end
end

-- Function to toggle to camelCase
function M.camel_case()
  local word = vim.fn.expand("<cword>")
  local camelCase = string
    .gsub(word, "_%l", function(match)
      return string.upper(match:sub(2))
    end)
    :gsub("^%u", function(match)
      return string.lower(match)
    end)

  if camelCase ~= word then
    vim.cmd("normal ciw" .. camelCase)
  end
end

-- Function to toggle to PascalCase
function M.pascal_case()
  local word = vim.fn.expand("<cword>")
  local PascalCase = string.gsub(word, "_%l", function(match)
    return string.upper(match:sub(2))
  end)
  PascalCase = string.gsub(PascalCase, "^%l", string.upper)
  if PascalCase ~= word then
    vim.cmd("normal ciw" .. PascalCase)
  end
end

-- Function to transform a string to a symbol
function M.transform_string_to_symbol()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local _, col = cursor_pos[1], cursor_pos[2] + 1 -- Convert to 1-based column index
  local line = vim.api.nvim_get_current_line()

  local pattern = "()([\"'])([^\"']+)%2()"

  local matches = {}
  for match_left, _, content, match_right in line:gmatch(pattern) do
    table.insert(matches, { left = tonumber(match_left), right = tonumber(match_right), content = content })
  end

  for _, match in ipairs(matches) do
    if col >= match.left and col <= match.right then
      local transformed_line = line:sub(1, match.left - 1) .. ":" .. match.content .. line:sub(match.right)
      vim.api.nvim_set_current_line(transformed_line)
      return
    end
  end

  vim.notify("No string found under the cursor!", vim.log.levels.WARN)
end

return M
