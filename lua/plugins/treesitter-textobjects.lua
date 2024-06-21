local M = {
  ---@diagnostic disable-next-line: missing-fields
  require("nvim-treesitter.configs").setup({
    textobjects = {
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
    },
  }),
}

return M
