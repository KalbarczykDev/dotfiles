local M = {}

function M.setup()
  local ufo = require "ufo"

  vim.o.foldcolumn = "1" -- '0' is no fold column, '1' is minimal
  vim.o.foldlevel = 99 -- Using ufo provider, need high foldlevel
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true -- Enable folding at startup

  ufo.setup {
    provider_selector = function(bufnr, filetype, buftype)
      -- Prioritize Treesitter first, then fallback to indent
      return { "treesitter", "indent" }
    end,
  }
end

return M
