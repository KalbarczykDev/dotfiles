local on_attach = require "configs.lsp.on_attach"
local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
  setup = {
    filetypes = { "toml" },
    settings = {
      evenBetterToml = {
        schema = { enabled = true },
      },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
}
