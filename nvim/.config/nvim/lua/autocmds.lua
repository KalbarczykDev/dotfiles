vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.config",
  callback = function()
    vim.bo.filetype = "ini"
  end,
})

-- Spell check only in prose filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end,
})
