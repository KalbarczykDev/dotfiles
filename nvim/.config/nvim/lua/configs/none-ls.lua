local none_ls = require "null-ls"
local on_attach = require "configs.lsp.on_attach"

local formatting = none_ls.builtins.formatting
local diagnostics = none_ls.builtins.diagnostics

local eslint_d = require "none-ls.diagnostics.eslint_d"
local eslint_code_actions = require "none-ls.code_actions.eslint_d"

none_ls.setup {
  sources = {
    -- JS/TS
    eslint_d, --TODO: make eslint work only when the config is present
    eslint_code_actions,
  },
  on_attach = on_attach,
}
