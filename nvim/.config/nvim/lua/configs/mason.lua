require("mason").setup()


vim.schedule(function()
  vim.api.nvim_exec_autocmds("User", { pattern = "MasonReady" })
end)
