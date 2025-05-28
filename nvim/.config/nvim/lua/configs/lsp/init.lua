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
--[[
  🌐 Web Dev Stack — LSP, DAP, Linters, Formatters, Tests

  📦 JavaScript / TypeScript / TSX
  - LSP: tsserver
  - DAP: vscode-js-debug (via nvim-dap)
  - Linter: eslint
  - Formatter: prettier
  - Tests: jest, vitest, mocha (via neotest, jest.nvim, or dap-jest)

  🐘 PHP
  - LSP: intelephense / phpactor
  - DAP: vscode-php-debug (with Xdebug)
  - Linter: phpcs / phpstan / psalm
  - Formatter: phpcbf / php-cs-fixer
  - Tests: PHPUnit (via neotest-phpunit or dap)

  📄 HTML
  - LSP: html
  - DAP: none
  - Linter: eslint-plugin-html (optional)
  - Formatter: prettier
  - Tests: n/a

  🅰️ Angular (with HTML/TS)
  - LSP: angularls
  - DAP: vscode-js-debug
  - Linter: eslint (Angular CLI built-in)
  - Formatter: prettier
  - Tests: Jasmine + Karma (can run via neotest if script configured)

  🧩 Blade (Laravel Templates)
  - LSP: none
  - DAP: none
  - Linter: none
  - Formatter: blade-formatter
  - Tests: n/a

  🧱 Vue
  - LSP: volar (preferred) / vetur
  - DAP: vscode-js-debug
  - Linter: eslint (with eslint-plugin-vue)
  - Formatter: prettier (with prettier-plugin-vue)
  - Tests: vitest / jest (via neotest)

  🎨 CSS / SCSS
  - LSP: cssls
  - DAP: none
  - Linter: stylelint
  - Formatter: prettier / stylelint --fix
  - Tests: n/a

  🗄️ SQL
  - LSP: sqls / sqlls / sqlite-lsp
  - DAP: none
  - Linter: sqlfluff / sqlint
  - Formatter: sql-formatter
  - Tests: raw SQL validation only

  ⚙️ Config / Meta files

  - Lua
    - LSP: lua_ls
    - Linter: luacheck
    - Formatter: stylua

  - XML
    - LSP: lemminx
    - Linter: none
    - Formatter: xmlformatter


  - YAML
    - LSP: yamlls
    - Linter: yamllint
    - Formatter: prettier / yamlfmt


  - JSON / JSON5
    - LSP: jsonls
    - Linter: eslint (config files)
    - Formatter: prettier


  - TOML
    - LSP: taplo
    - Linter: taplo-lint
    - Formatter: taplo fmt


  - Gitignore / Editorconfig
    - LSP: none
    - Linter: none
    - Formatter: none


  📝 Markdown / Docs
  - LSP: marksman / ltex / markdown_ls
  - Linter: markdownlint
  - Formatter: prettier


  🐚 Bash
  - LSP: bashls
  - Linter: shellcheck
  - Formatter: shfmt



]]
