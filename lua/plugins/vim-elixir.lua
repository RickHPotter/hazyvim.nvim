local M = {
  "elixir-lang/vim-elixir",
  dependencies = {
    "thinca/vim-ref",
    {
      "awetzel/elixir.nvim",
      run = "yes | ./install.sh",
    },
  },
}

return M
