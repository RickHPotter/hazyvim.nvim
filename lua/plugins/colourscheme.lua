local M = {
  { "Everblush/nvim", name = "everblush" },
  { "folke/tokyonight.nvim", lazy = false },
  { "EdenEast/nightfox.nvim", lazy = false, priority = 1000 },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  { "navarasu/onedark.nvim", name = "onedark-nav", lazy = false, priority = 1000 },
  { "olimorris/onedarkpro.nvim", priority = 1000 },
  { "rebelot/kanagawa.nvim", priority = 1000 },
  { "rose-pine/neovim", name = "rose-pine" },
  { "xiyaowong/transparent.nvim" },
  { "rcarriga/nvim-notify", opts = { background_colour = "#000000" } },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark_dark",
    },
  },
}

return M
