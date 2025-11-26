vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.config",
  callback = function()
    vim.bo.filetype = "ini"
  end,
})
