local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "semanticart/ruby-code-actions.nvim" },
  },
  config = function()
    local none_ls = require("null-ls")
    local ruby_code_actions = require("ruby-code-actions")
    local sources = {
      -- require any built-ins you want
      none_ls.builtins.formatting.rubocop,
      none_ls.builtins.diagnostics.rubocop,
      -- ...
      -- now require any ruby-code-actions you want
      ruby_code_actions.insert_frozen_string_literal,
      ruby_code_actions.autocorrect_with_rubocop,
    }
    none_ls.setup({ sources = sources })
  end,
}

return {}

-- this did not work as it made null-ls the default ruby lsp, but
-- i'm very interested in this
