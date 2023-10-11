return {
  "nvimtools/none-ls.nvim",
  optional = true,
  opts = function(_, opts)
    if type(opts.sources) == "table" then
      local nls = require("null-ls")

      if vim.fn.executable("credo") == 0 then
        return
      end

      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, {
        nls.builtins.code_actions.gomodifytags,
        nls.builtins.code_actions.impl,
        nls.builtins.formatting.gofumpt,
        nls.builtins.formatting.goimports_reviser,
        nls.builtins.formatting.golines,
        nls.builtins.diagnostics.credo,
      })
    end
  end,
}
