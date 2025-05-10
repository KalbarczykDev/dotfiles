local on_attach = require "configs.lsp.on_attach"
local capabilities = require "configs.lsp.capabilities"

return {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  settings = {
    python = {
      pythonPath = vim.fn.getcwd() .. "/.venv/bin/python", -- macOS/Linux
      -- pythonPath = vim.fn.getcwd() .. "\\.venv\\Scripts\\python.exe", -- Windows
    },
  },
}
