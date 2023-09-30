return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "ruby",

        "go",
        "gomod",
        "gowork",
        "gosum",

        "elixir",
        "heex",
        "eex",
      })

      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "ron",
          "rust",
          "toml",

          "typescript",
          "tsx",

          "json",
          "json5",
          "jsonc",

          "ninja",
          "python",
          "rst",
          "toml",
        })
      end
    end,
  },
}
