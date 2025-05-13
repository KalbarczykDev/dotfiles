local M = {}

function M.setup()
  local default = require "nvchad.configs.nvimtree"
  local nvimtree = require "nvim-tree"

  local opts = {
    view = {
      width = 50,
      side = "left",
    },
    renderer = {
      highlight_git = true,
      group_empty = true,
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
      },
    },
    filters = {
      dotfiles = false,
      custom = { ".DS_Store" },
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
  }

  nvimtree.setup(vim.tbl_deep_extend("force", default, opts))
end

M.setup()
