local M = {}

M.notify = function(title, msg, level)
  vim.notify(msg, level or vim.log.levels.INFO, {
    title = title,
    timeout = 2500,
  })
end

return M
