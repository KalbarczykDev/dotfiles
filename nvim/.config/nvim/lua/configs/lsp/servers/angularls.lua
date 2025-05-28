local capabilities = require "configs.lsp.capabilities"
local util = require "lspconfig.util"

return {

  capabilities = capabilities,
  cmd = { "angular-language-server", "--stdio" },
  filetypes = { "typescript", "html", "typescriptreact" },
  root_dir = util.root_pattern "angular.json",
}
