local M = {}

function M.setup()
  local db = require "dashboard"

  db.setup {
    theme = "hyper",
  }
end

return M
