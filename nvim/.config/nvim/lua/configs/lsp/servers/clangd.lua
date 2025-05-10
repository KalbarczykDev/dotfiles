local on_attach = require "configs.lsp.on_attach"
local capabilities = require "configs.lsp.capabilities"

return {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=bundled",
    "--inlay-hints",
  },
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
}
