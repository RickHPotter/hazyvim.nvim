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

return M
