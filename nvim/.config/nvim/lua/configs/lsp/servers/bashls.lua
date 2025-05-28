local capabilities = require "configs.lsp.capabilities"
return {
  setup = {
    filetypes = { "sh", "bash" },
  },

  capabilities = capabilities,
}
