return {
  {
    "otavioschwanck/ruby-toolkit.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-treesitter/nvim-treesitter-textobjects" },
    keys = {
      {
        "<leader>mv",
        "<cmd>lua require('ruby-toolkit').extract_variable()<CR>",
        desc = "Extract Variable",
        mode = { "v" },
      },
      -- FIXME: neither one below works
      {
        "<leader>mf",
        "<cmd>lua require('ruby-toolkit').extract_to_function()<CR>",
        desc = "Extract To Function",
        mode = { "v" },
      },
      {
        "<leader>mf",
        "<cmd>lua require('ruby-toolkit').create_function_from_text()<CR>",
        desc = "Create Function from item on cursor",
      },
    },
  },
  {
    "vim-ruby/vim-ruby",
    keys = {
      { "XIF", "<Esc>Iif <Esc>oend<Esc>O", desc = "Turn line into if block and get in", mode = "i" },
      { "XIE", "<Esc>Iif <Esc>oend<Esc>Oelse<Esc>O", desc = "Turn line into if block and get in", mode = "i" },
      { "XES", "<Esc>oelse<Esc>o", desc = "Write else block and get in", mode = "i" },
      { "FES", "<Esc>/^else<CR>:nohlsearch<CR>o", desc = "Jump to else and get in", mode = "i" },
      { "XEND", "<Esc>oend<Esc>O", desc = "End block while still in", mode = "i" },
    },
  },
  { "tpope/vim-dispatch" },
  { "tpope/vim-rake" },
  { "tpope/vim-rails" },
  { "tpope/vim-bundler" },
}
