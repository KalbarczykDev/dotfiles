local M = {}

M.setup = function()
  -- require("java").setup() FIX: currently produces runtime error debugger does not work only lsp
  require("lspconfig").jdtls.setup {}
end

return M
