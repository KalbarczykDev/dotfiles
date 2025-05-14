local actions = require "telescope.actions"

require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    },
  },
  defaults = {
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
