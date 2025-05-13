local M = {}

function M.setup()
  local default = require "nvchad.configs.nvimtree"

  require("nvim-tree").setup(vim.tbl_deep_extend("force", default, {
    view = {
      width = 40,
    },
    renderer = {
      highlight_git = true,
    },
  }))
end

M.setup()
