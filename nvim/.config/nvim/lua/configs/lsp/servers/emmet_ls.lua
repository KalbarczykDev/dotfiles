local capabilities = require "configs.lsp.capabilities"

return {

  capabilities = capabilities,
  filetypes = {
    "html",
    "css",
    "scss",
    "javascriptreact",
    "typescriptreact",
    "vue",
    "svelte",
    "blade",
    "razor",
  },
}
