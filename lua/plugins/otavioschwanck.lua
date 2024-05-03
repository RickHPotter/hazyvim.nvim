local M = {
  "junegunn/vim-easy-align",
  {
    "otavioschwanck/arrow.nvim",
    event = "VeryLazy",
    opts = {
      always_show_path = false,
      show_icons = true,
      mappings = {
        edit = "e",
        delete_mode = "d",
        clear_all_items = "C",
        toggle = "s",
        open_vertical = "v",
        open_horizontal = "-",
        quit = "q",
      },
      leader_key = ";",
      buffer_leader_key = "m",
      after_9_keys = "zxcbnmZXVBNM,afghjklAFGHJKLwrtyuiopWRTYUIOP", -- Please, don't pin more then 9 XD,
      save_key = function()
        return vim.loop.cwd() -- we use the cwd as the context from the bookmarks.  You can change it for anything you want.
      end,
      full_path_list = { "update_stuff" }, -- filenames on this list will ALWAYS show the file path too.
    },
    keys = {
      {
        "<C-j>",
        "<cmd>Arrow next_buffer_bookmark<CR>",
        desc = "Save Current Line",
      },
      {
        "<C-k>",
        "<cmd>Arrow prev_buffer_bookmark<CR>",
        desc = "Save Current Line",
      },
    },
  },
  { "otavioschwanck/new-file-template.nvim", opts = {} },
  { "otavioschwanck/tmux-awesome-manager.nvim" },
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
}

return M
