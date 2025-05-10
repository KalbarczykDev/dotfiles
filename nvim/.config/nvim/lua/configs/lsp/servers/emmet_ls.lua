local on_attach = require "configs.lsp.on_attach"
local capabilities = require "configs.lsp.capabilities"

return {
  on_attach = on_attach,
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
