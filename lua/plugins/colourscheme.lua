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
  { "scottmckendry/cyberdream.nvim", lazy = false, priority = 1000 },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_enable_italic = true
      vim.o.background = "light"
    end,
  },
  { "sonph/onehalf" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
      -- colorscheme = "catppuccin-latte",
    },
  },
}

return M
