return {
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },

  {
    "nvim-mini/mini.indentscope",
    opts = {
      draw = {
        delay = 100,
        animation = function()
          return 20
        end,
      },
    },
  },
}
