local M = {
  {
    "williamboman/mason.nvim",
    optional = true,
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "solargraph",

          "gopls",

          "rust-analyzer",

          "typescript-language-server",
          "json-to-struct",
          "eslint-lsp",
          "html-lsp",
          "htmlbeautifier",
          "emmet-ls",

          "ruby-lsp",
          "solargraph",
          "erb-lint",

          "elixir-ls",
        })
      end
    end,
  },
}

return M
