local M = {}

M.setup = function()
  local notify = require "notify"

  notify.setup {
    render = "wrapped-compact",
    top_down = true,
  }

  vim.notify = notify
end

return M
