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
