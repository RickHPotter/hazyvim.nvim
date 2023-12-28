-- there is just so much more that can be done with this
-- https://github.com/ThePrimeagen/refactoring.nvim

local M = {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("refactoring").setup()
  end,
}

return M
