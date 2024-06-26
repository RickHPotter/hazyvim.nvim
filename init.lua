require("config.lazy")
require("lspconfig").emmet_language_server.setup({})

vim.opt.relativenumber = true
vim.g.dap_virtual_text = true

-- codeium
vim.g.codeium_disable_bindings = 1
vim.g.codeium_filetypes = { TelescopePrompt = false }

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
  pattern = { "markdown", "yaml" },
  callback = function()
    vim.b.autoformat = false
  end,
})
