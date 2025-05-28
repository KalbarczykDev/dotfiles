local capabilities = require "configs.lsp.capabilities"
local util = require "lspconfig.util"

return {

  capabilities = capabilities,
  filetypes = {
    "typescript",
    "javascript",
    "typescriptreact",
    "javascriptreact",
  },
  root_dir = util.root_pattern("tsconfig.json", "package.json", ".git"),
  single_file_support = true,
}
