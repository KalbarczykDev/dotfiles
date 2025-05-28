local severity_icons = {
  [vim.diagnostic.severity.ERROR] = "",
  [vim.diagnostic.severity.WARN] = "",
  [vim.diagnostic.severity.HINT] = "",
  [vim.diagnostic.severity.INFO] = "",
}

vim.diagnostic.config {
  virtual_text = true,

  signs = {
    text = severity_icons,
  },
  underline = true,
  update_in_insert = true,
  severity_sort = true,
}

local cmp_lsp = require "cmp_nvim_lsp"
local capabilities =
  vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

local servers = {
  ts_ls = true, --JS/TS/TSX and JSX
  intelephense = true, --PHP/Laravel/Blade
  vue_language_server = true, --vue
  angularls = true, --angular
  html = true, --html
  emmet_ls = true, --html snippets
  lua_ls = true, --lua
  cssls = true, --css/scss
  sqls = true, --sql
  lemminx = true, --xml
  yamlls = true, --yaml
  jsonls = true, --json
  taplo = true, -- Toml
  marksman = true, --markdown
  bashls = true, --shell
}

local lspconfig = require "lspconfig"

for name, config in pairs(servers) do
  if config == true then
    lspconfig[name].setup {
      capabilities = capabilities,
    }
  else
    lspconfig[name].setup(vim.tbl_deep_extend("force", config, {
      capabilities = capabilities,
    }))
  end
end
