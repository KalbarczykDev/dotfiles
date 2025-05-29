return {
  --prettier notifications
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require "notify"

      notify.setup {
        render = "wrapped-compact",
        top_down = true,
      }

      vim.notify = notify
    end,
  },
}
