local M = {}

M.setup = function()
  --set zsh files to bash filetype
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.zsh", ".zshrc" },
    callback = function()
      vim.bo.filetype = "bash"
    end,
  })
end

return M
