return {
  --Fuzzy finder + gui
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-dap.nvim",
      {
        "folke/noice.nvim",
        config = function()
          require("noice").setup {
            lsp = {
              hover = {
                enabled = false,
              },
              signature = {
                enabled = false,
              },
              progress = {
                enabled = false,
              },
            },
          }
        end,
        dependencies = {
          "MunifTanjim/nui.nvim",
          "rcarriga/nvim-notify",
        },
      },
    },
    config = function()
      local actions = require "telescope.actions"

      require("telescope").setup {
        pickers = {
          live_grep = {
            file_ignore_patterns = { "node_modules", ".git", ".venv", ".class" },
            additional_args = function(_)
              return { "--hidden" }
            end,
          },
          find_files = {
            file_ignore_patterns = { "node_modules", ".git", ".venv", ".class" },
            hidden = true,
          },
        },
        extensions_list = { "themes", "terms" },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
          },
        },
        defaults = {
          prompt_prefix = "   ",
          selection_caret = " ",
          entry_prefix = " ",
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
            },
            width = 0.87,
            height = 0.80,
          },
          mappings = {
            i = {
              ["<Esc>"] = actions.close,
            },
            n = {
              ["<Esc>"] = actions.close,
            },
          },
        },
      }
      require("telescope").load_extension "ui-select"
      require("telescope").load_extension "noice"
      require("telescope").load_extension "dap"
    end,
  },
}
