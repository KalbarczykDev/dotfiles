local M = {}

M.setup = function()
  -- require("java").setup()
  require("lspconfig").jdtls.setup {}
end

return M
