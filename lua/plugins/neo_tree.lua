local M = {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {},
        never_show = {
          ".git",
          ".ruby-lsp",
          ".bundle",
          ".DS_Store",
          "thumbs.db",
        },
      },
    },
  },
}

return M
