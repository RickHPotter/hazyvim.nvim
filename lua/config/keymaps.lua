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

-- aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

-- toggle
local toggle = require("config.toggle_case")

mapper({ "n" }, "<leader>psc", toggle.snake_case, "Toggle Snake Case")
mapper({ "n" }, "<leader>pcc", toggle.camel_case, "Toggle Camel Case")
mapper({ "n" }, "<leader>ppc", toggle.pascal_case, "Toggle Pascal Case")

-- refactoring
mapper("x", "<leader>re", function()
  require("refactoring").refactor("Extract Function")
end, "Extract Function")
mapper("x", "<leader>rf", function()
  require("refactoring").refactor("Extract Function To File")
end, "Extract Function to File")
mapper("x", "<leader>rv", function()
  require("refactoring").refactor("Extract Variable")
end, "Extract Variable")
mapper("n", "<leader>rb", function()
  require("refactoring").refactor("Extract Block")
end, "Extract Block")
mapper("n", "<leader>rbf", function()
  require("refactoring").refactor("Extract Block To File")
end, "Extract Block to File")

mapper("n", "<leader>rI", function()
  require("refactoring").refactor("Inline Function")
end, "Inline Function")
mapper({ "n", "x" }, "<leader>ri", function()
  require("refactoring").refactor("Inline Variable")
end, "Inline Variable")

-- tmux
mapper({ "n", "t" }, "<C-h>", vim.cmd.TmuxNavigateLeft, "Tmux Navigate Left")
mapper({ "n", "t" }, "<C-j>", vim.cmd.TmuxNavigateDown, "Tmux Navigate Down")
mapper({ "n", "t" }, "<C-k>", vim.cmd.TmuxNavigateUp, "Tmux Navigate Up")
mapper({ "n", "t" }, "<C-l>", vim.cmd.TmuxNavigateRight, "Tmux Navigate Right")
