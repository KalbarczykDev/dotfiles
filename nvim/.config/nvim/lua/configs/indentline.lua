local M = {}

function M.setup()
  require("ibl").setup {
    indent = {
      char = "│",
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
      injected_languages = true,
      highlight = { "IblScope" },
      char = "│",
    },
    exclude = {
      filetypes = { "help", "lazy", "NvimTree", "alpha" },
      buftypes = { "terminal", "nofile" },
    },
  }
end

return M
