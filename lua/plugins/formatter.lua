local M = {
  {
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup({
        logging = true,
        log_level = vim.log.levels.WARN,
        filetype = {
          ruby = {
            function()
              return {
                exe = "rubocop",
                args = { "-a" },
                stdin = false,
              }
            end,
          },
          lua = {
            require("formatter.filetypes.lua").stylua,
          },
          ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
          },
        },
      })
    end,
  },
}

return M
