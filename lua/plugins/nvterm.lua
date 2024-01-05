local M = {
  {
    "NvChad/nvterm",
    event = "VeryLazy",
    keys = {
      -- stylua: ignore
      -- `<Esc><Esc>` enter normal mode, then switch windows
    },
    config = function()
      require("nvterm").setup({
        terminals = {
          type_opts = {
            float = {
              border = "single",
              relative = "editor",
              row = 0.05,
              col = 0.05,
              width = 0.9,
              height = 0.82,
            },
          },
        },
      })
    end,
  },
}

return M
