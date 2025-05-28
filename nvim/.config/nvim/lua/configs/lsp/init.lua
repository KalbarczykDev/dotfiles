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
  bashls = require "configs.lsp.servers.bashls",
  taplo = require "configs.lsp.servers.taplo",
}

for name, opts in pairs(servers) do
  require("lspconfig")[name].setup(opts)
end

--TODO: rework the lsp system
--1. check configurations on the official nvim-lspconfig github
--2. check tjdevries and the primagean configs for lsp
--https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/lazy/lsp.lua
--https://github.com/tjdevries/config.nvim/blob/master/lua/custom/plugins/lsp.lua
--3. formating with conform maybe instead of null ls
