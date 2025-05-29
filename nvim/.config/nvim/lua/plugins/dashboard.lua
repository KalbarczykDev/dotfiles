return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local db = require "dashboard"

      db.setup {
        theme = "hyper",
      }
    end,
  },
}
