-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- augroup("write_pre", { clear = true })
-- autocmd("BufWritePre", {
--   pattern = "*.ex,*.exs",
--   callback = function()
--     local cursor_pos = vim.fn.getpos(".")
--     local path = vim.fn.expand("%")
--     local str = "terminal mix format " .. path
--     vim.cmd(str)
--     vim.fn.setpos(".", cursor_pos)
--   end,
--   group = "write_pre",
--   desc = "Format Elixir",
-- })

autocmd("BufWritePost", {
  group = augroup("_formatter", { clear = true }),
  pattern = "*",
  command = "FormatWrite",
})
