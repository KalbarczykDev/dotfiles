local severity_icons = {
  [vim.diagnostic.severity.ERROR] = "",
  [vim.diagnostic.severity.WARN] = "",
  [vim.diagnostic.severity.HINT] = "",
  [vim.diagnostic.severity.INFO] = "",
}

vim.diagnostic.config {
  virtual_text = false, --needs to be false when using virtual lines
  virtual_lines = {
    current_line = false,
    format = function(diagnostic)
      local icon = severity_icons[diagnostic.severity] or ""
      return icon .. " " .. diagnostic.message
    end,
  },
  signs = {
    text = severity_icons,
  },
  underline = true,
  update_in_insert = true,
  severity_sort = true,
}

vim.cmd [[
  highlight DiagnosticError guifg=#f38ba8
  highlight DiagnosticWarn guifg=#fab387
  highlight DiagnosticInfo guifg=#89b4fa
  highlight DiagnosticHint guifg=#cba6f7
]]

local servers = {
  lua_ls = require "configs.lsp.servers.lua_ls",
  clangd = require "configs.lsp.servers.clangd",
  pyright = require "configs.lsp.servers.pyright",
  ruff = require "configs.lsp.servers.ruff",
  lemminx = require "configs.lsp.servers.lemminx",
  yamlls = require "configs.lsp.servers.yamlls",
  ts_ls = require "configs.lsp.servers.ts_ls",
  angularls = require "configs.lsp.servers.angularls",
  html = require "configs.lsp.servers.html",
  cssls = require "configs.lsp.servers.cssls",
  jsonls = require "configs.lsp.servers.jsonls",
  emmet_ls = require "configs.lsp.servers.emmet_ls",
  svelte = require "configs.lsp.servers.svelte",
  astro = require "configs.lsp.servers.astro",
  volar = require "configs.lsp.servers.volar",
}

for name, opts in pairs(servers) do
  require("lspconfig")[name].setup(opts)
end
