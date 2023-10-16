local M = {
  {
    "Everblush/nvim",
    name = "everblush",
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = true,
    --config= function()
    --vim.opt.background = 'dark'
    --vim.cmd([[colorscheme oxocarbon]])
    --end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.cmd([[colorscheme carbonfox]])
    -- end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "oxocarbon",
    },
  },
}

return M
