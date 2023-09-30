-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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
local mapper = function(mode, key, result)
  vim.keymap.set(mode, key, result, { noremap = true, silent = true })
end

-- while typing
mapper("i", "jj", "<Esc>") -- leave insert mode
mapper("i", "<Esc>", "<Esc>") -- leave insert mode

mapper("i", "<C-b>", "<Esc>I") -- new line next line
mapper("i", "<C-e>", "<Esc>A") -- new line previous line

mapper("i", "<A-n><A-m>", "<Esc>o") -- new line next line
mapper("i", "<A-m><A-n>", "<Esc>O") -- new line previous line

mapper("i", "<C-k>", "<Esc>ddkPi") -- move line up
mapper("i", "<C-j>", "<Esc>ddpI") -- move line down

-- while commanding
mapper("n", "<C-j>", "ddp") -- move line down
mapper("n", "<C-k>", "ddkP") -- move line up

mapper("n", "<A-n><A-m>", "o<Esc>") -- new line next line
mapper("n", "<A-m><A-n>", "O<Esc>") -- new line previous line

mapper("n", "<A-c><A-m>", "<Esc>yyp") -- duplicate current line down
mapper("n", "<A-c><A-n>", "<Esc>yyP") -- duplicate current line up

-- while visualising
mapper("v", "<C-k>", ":m '<-2<CR>gv=gv") -- move line down
mapper("v", "<C-j>", ":m '>+1<CR>gv=gv") -- move line up

-- encapsulators
-- use gza for this
-- mapper("x", "'", "c'<Esc>pa'")
-- mapper("x", '"', "c'<Esc>pa'")
-- mapper("x", "`", "c`<Esc>pa`")
-- mapper("x", "[", "c[<Esc>pa]")
-- mapper("x", "{", "c{<Esc>pa}")
-- mapper("x", "<", "c<<Esc>pa>")

-- codeium
vim.keymap.set("i", "<C-c>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true })

vim.keymap.set("i", "<C-a>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true })

vim.keymap.set("i", "<C-d>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true })

vim.keymap.set("i", "<C-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true })

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
