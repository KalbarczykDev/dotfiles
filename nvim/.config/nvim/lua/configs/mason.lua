local M = {}

M.setup = function()
  require("mason").setup {
    PATH = "skip",
    ui = {
      icons = {
        package_pending = " ",
        package_installed = " ",
        package_uninstalled = " ",
      },
    },
    max_concurrent_installers = 10,
  }

  vim.schedule(function()
    vim.api.nvim_exec_autocmds("User", { pattern = "MasonReady" })
  end)
end

return M
