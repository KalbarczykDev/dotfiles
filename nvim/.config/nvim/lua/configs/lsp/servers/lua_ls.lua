local on_attach = require "configs.lsp.on_attach"
local capabilities = require "configs.lsp.capabilities"

return {
  cmd = { "lua-language-server", "--force-accept-workspace" },
  filetypes = { "lua" },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      hint = {
        enable = true,
        setType = true,
        paramType = true,
        paramName = "All",
        arrayIndex = "Auto",
      },
      diagnostics = {
        globals = { "vim" },
      },
      telemetry = { enable = false },
    },
  },
}
