-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- MODES
--
-- normal_mode = "n"
-- insert_mode = "i"
-- visual_mode = "v"
-- visual_block_mode = "x"
-- term_mode = "t"
-- command_mode = "c"

--[[ keys.lua ]]
local mapper = function(mode, key, result, desc)
  desc = desc or "No description given yet"
  vim.keymap.set(mode, key, result, { noremap = true, silent = true, desc = desc })
end

-- while typing
mapper("i", "jj", "<Esc>", "Leave insert mode")
mapper("i", "<Esc>", "<Esc>", "Leave insert mode")

mapper("i", "<C-b>", "<Esc>I", "Go to the begginning of the line")
mapper("i", "<C-e>", "<Esc>A", "Go to the end of the line")

mapper("i", "<C-h>", "<Left>", "Go left")
mapper("i", "<C-l>", "<Right>", "Go right")

mapper("i", "<A-m><A-n>", "<Esc>O", "New line previous line")
mapper("i", "<A-n><A-m>", "<Esc>o", "New line next line")

-- while commanding
mapper("n", "<A-n><A-m>", "o<Esc>", "New line next line")
mapper("n", "<A-m><A-n>", "O<Esc>", "New line previous line")

mapper("n", "<C-c>", "ggyG", "Copy the whole file")
mapper("n", "<C-i>", "gg=G", "Indent the whole file")
mapper("n", "<A-b>", "D<Esc>o<Esc>p", "Break to the next line")

mapper("n", "n", "nzz", "Next search result middle")
mapper("n", "N", "Nzz", "Previous search result middle")

-- while visualising
-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
mapper("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', "Pasting without copying replaced text")

-- codeium
vim.keymap.set("i", "<C-c>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, desc = "Accept completion" })

vim.keymap.set("i", "<C-a>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, desc = "Previous Codeium completion" })

vim.keymap.set("i", "<C-d>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, desc = "Next Codeium completion" })

vim.keymap.set("i", "<C-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, desc = "Clear Codeium completions" })

-- aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

-- toggle
local toggle = require("config.toggle_case")

mapper({ "n" }, "<leader>psc", toggle.snake_case, "Toggle Snake Case")
mapper({ "n" }, "<leader>pcc", toggle.camel_case, "Toggle Camel Case")
mapper({ "n" }, "<leader>ppc", toggle.pascal_case, "Toggle Pascal Case")

-- terminal
local terminal = require("nvterm.terminal")
local modes = { "n", "t" }

mapper(modes, "<A-h>", function()
  terminal.toggle("horizontal")
end, "Toggle Horizontal Terminal")
mapper(modes, "<A-v>", function()
  terminal.toggle("vertical")
end, "Toggle Vertical Terminal")
mapper(modes, "<A-i>", function()
  terminal.toggle("float")
end, "Toggle Floating Terminal")
