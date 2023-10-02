-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- MODES
--
-- normal_mode = "n"
-- insert_mode = "i"
-- visual_mode = "v"
-- visual_block_mode = "x"
-- term_mode = "t"
-- command_mode = "c"

local M = {}

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

mapper("i", "<A-m><A-n>", "<Esc>O", "New line previous line")
mapper("i", "<A-n><A-m>", "<Esc>o", "New line next line")

-- while commanding
mapper("n", "<A-n><A-m>", "o<Esc>", "New line next line")
mapper("n", "<A-m><A-n>", "O<Esc>", "New line previous line")

mapper("n", "<C-c>", "ggyG", "Copy the whole file")
mapper("n", "<C-i>", "gg=G", "Indent the whole file")
mapper("n", "<A-b>", "D<Esc>o<Esc>p", "Break to the next line")

-- while visualising

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

-- FIXME: following are not working!!!
--
-- GO
--
M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags",
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags",
    },
  },
}
--
-- RUST
--
M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates",
    },
  },
}

return M
