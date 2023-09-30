return {
  { "otavioschwanck/ruby-toolkit.nvim" },
  { "vim-ruby/vim-ruby" },
  { "tpope/vim-dispatch" },
  { "tpope/vim-rake" },
  { "tpope/vim-rails" },
  { "tpope/vim-bundler" },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "olimorris/neotest-rspec",
    },
    opts = {
      adapters = {
        ["neotest-rspec"] = {
          -- NOTE: By default neotest-rspec uses the system wide rspec gem instead of the one through bundler
          -- rspec_cmd = function()
          --   return vim.tbl_flatten({
          --     "bundle",
          --     "exec",
          --     "rspec",
          --   })
          -- end,
        },
      },
    },
  },
}
