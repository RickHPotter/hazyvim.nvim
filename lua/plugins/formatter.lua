local M = {
  "mhartington/formatter.nvim",
  config = function()
    local ruby_version = vim.fn.system("ruby -v")

    require("formatter").setup({
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        ruby = {
          function()
            local current_buffer = vim.fn.expand("%:p")
            if ruby_version:find("^2%.[0123]") then
              vim.notify("Ruby too old for this shit.")
              vim.notify("Ruby version: " .. ruby_version)
              return {}
            else
              return {
                exe = "rubocop",
                args = {
                  "-a",
                  -- "--fix-layout",
                  -- "--autocorrect-all",
                  -- current_buffer,
                  -- "--format",
                  -- "files",
                },
                stdin = false,
              }
            end
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
}

return M
