--set zsh files to bash filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.zsh", ".zshrc" },
  callback = function()
    vim.bo.filetype = "bash"
  end,
})
--set pl files to prolog filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.pl" },
  callback = function()
    vim.bo.filetype = "prolog"
  end,
})

--attach colorizer to buffer
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    local ok, c = pcall(require, "colorizer")
    if ok then
      c.attach_to_buffer(args.buf)
    end
  end,
})
