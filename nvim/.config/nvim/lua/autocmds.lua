local M = {}

M.setup = function()
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
end

return M
