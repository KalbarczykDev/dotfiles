local capabilities = require "configs.lsp.capabilities"

return {

  capabilities = capabilities,
  filetypes = { "yaml", "yaml.docker-compose" },
}
