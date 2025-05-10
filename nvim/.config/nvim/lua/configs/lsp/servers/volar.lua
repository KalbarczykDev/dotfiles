local on_attach = require "configs.lsp.on_attach"
local capabilities = require "configs.lsp.capabilities"
local util = require "lspconfig.util"

return {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "vue",
    "typescript",
    "javascript",
    "typescriptreact",
    "javascriptreact",
  },
  root_dir = util.root_pattern("vite.config.ts", "vue.config.js"),
}
