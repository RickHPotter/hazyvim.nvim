local M = {
  { "folke/tokyonight.nvim", lazy = false },
  { "EdenEast/nightfox.nvim", lazy = false },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false },
  { "olimorris/onedarkpro.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "rcarriga/nvim-notify", opts = { background_colour = "#000000" } },
  { "catppuccin/nvim", name = "catppuccin", lazy = false },
  { "yorik1984/newpaper.nvim" },
  { "xiyaowong/transparent.nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}

return M
