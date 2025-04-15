local M = {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        elixirls = {
          settings = {
            elixirLS = {
              dialyzerEnabled = true,
            },
          },
        },
        tailwindcss = {
          filetypes_include = {
            "ruby",
          },
        },
      },
      setup = {
        tailwindcss = function(_, opts)
          local tw = LazyVim.lsp.get_raw_config("tailwindcss")
          opts.filetypes = opts.filetypes or {}

          vim.list_extend(opts.filetypes, tw.default_config.filetypes)
          vim.list_extend(opts.filetypes, opts.filetypes_include or {})
          opts.filetypes = vim.tbl_filter(function(ft)
            return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
          end, opts.filetypes)

          opts.init_options = {
            userLanguages = {
              elixir = "phoenix-heex",
              eelixir = "phoenix-heex",
              heex = "phoenix-heex",
              ruby = "html",
            },
          }

          opts.settings = {
            tailwindCSS = {
              validate = true,
              includeLanguages = {
                typescript = "javascript",
                typescriptreact = "javascript",
                ["html-eex"] = "html",
                ["phoenix-heex"] = "html",
                heex = "html",
                eelixir = "html",
                elixir = "html",
                elm = "html",
                erb = "html",
                svelte = "html",
                rust = "html",
                ruby = "html",
              },
              experimental = {
                classRegex = {
                  [[class="([^"]*)]],
                  [[class: "([^"]*)]],
                  [[class: '([^']*)]],
                  [[class: %q%{([^}]*)%}]],
                },
              },
              lint = {
                cssConflict = "error",
                invalidApply = "error",
                invalidConfigPath = "error",
                invalidScreen = "error",
                invalidTailwindDirective = "error",
                invalidVariant = "error",
                recommendedVariantOrder = "error",
              },
            },
          }
        end,
      },
    },
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = "VeryLazy",
    opts = {
      filetypes = { "ruby", "eruby" },
      user_default_options = {
        tailwind = true,
        css = true,
        mode = "background",
      },
    },
    config = function(_, opts)
      require("colorizer").setup(opts)
    end,
  },
}

return M
