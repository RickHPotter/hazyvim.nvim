local M = {
  { "Everblush/nvim", name = "everblush" },
  { "folke/tokyonight.nvim", lazy = false },
  { "EdenEast/nightfox.nvim", lazy = false },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false },
  { "navarasu/onedark.nvim", name = "onedark-nav", lazy = false },
  { "olimorris/onedarkpro.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "rcarriga/nvim-notify", opts = { background_colour = "#000000" } },
  { "catppuccin/nvim", name = "catppuccin", lazy = false },
  { "projekt0n/github-nvim-theme" },
  { "yorik1984/newpaper.nvim" },
  { "xiyaowong/transparent.nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-latte",
    },
  },
}

return M
