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

  capabilities = capabilities,
}
