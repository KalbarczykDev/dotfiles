local on_attach = require "configs.lsp.on_attach"
local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
  name = "ruff",
  cmd = { "ruff", "server", "--preview" },
  filetypes = { "python" },
  root_dir = require("lspconfig.util").root_pattern("pyproject.toml", "ruff.toml", ".git"),
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    settings = {},
  },
}
