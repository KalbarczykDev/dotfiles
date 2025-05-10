local on_attach = require "configs.lsp.on_attach"
local capabilities = require "configs.lsp.capabilities"
local util = require "lspconfig.util"

return {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "angular-language-server", "--stdio" },
  filetypes = { "typescript", "html", "typescriptreact" },
  root_dir = util.root_pattern "angular.json",
}
