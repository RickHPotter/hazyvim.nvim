require("config.lazy")

vim.opt.relativenumber = true
vim.g.dap_virtual_text = true

vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
  callback = function()
    if vim.fn.getcwd() ~= vim.env.HOME then
      require("persistence").load()
    end
  end,
  nested = true,
})

-- Disable auto formatting on save for some filetypes
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown", "yaml", "eruby" },
  callback = function()
    vim.b.autoformat = false
  end,
})
