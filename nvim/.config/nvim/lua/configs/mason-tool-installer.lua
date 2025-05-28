require("mason-tool-installer").setup {
  ensure_installed = {

    --JavaScript/TypeScript/TSX AND JSX
    --LSP:
    "typescript-language-server",
    --DAP:
    "js-debug-adapter",
    --Linter:
    "eslint_d",
    --Formater:
    "prettierd",

    --PHP/Laravel/Blade
    --LSP:
    "intelephense",
    --DAP:
    "php-debug-adapter",
    --Linter:
    "phpstan",
    --Formater:
    "pint",
    "blade-formatter", -- blade template
    --Aditional diagnostics:
    "phpcs",

    --Vue
    --LSP:
    "vue-language-server",
    --DAP:
    --js-debug-adapter
    --Linter:
    --eslint
    --Formater:
    --prettierd

    --Angular
    --LSP:
    "angular-language-server",
    --DAP:
    --js-debug-adapter
    --Linter:
    --eslint
    --Formater:
    --prettierd

    --HTML
    --LSP:
    "html-lsp",
    --Snippets:
    "emmet_ls",
    --Formater:
    --prettierd

    --CSS/SCSS
    --LSP:
    "css-lsp",
    --Linter:
    "stylelint",
    --Formater:
    --prettierd

    --Lua
    --LSP:
    "lua-language-server",
    --Formater:
    "stylua",

    --SQL
    --LSP:
    "sqls",
    --Linter:
    "sqlfluff",
    --Formater:
    "sql-formatter",

    --XML
    --LSP:
    "lemminx",
    --Formater:
    "xmlformatter",

    --Yaml
    --LSP:
    "yaml-language-server",
    --Linter:
    "yamllint",
    --Formater:
    --prettierd

    --JSON/JSON5
    --LSP:
    "json-lsp",
    --Linter:
    --eslint
    --Formater:
    --prettierd

    --TOML
    -- LSP:
    "taplo",

    --Markdown
    --LSP
    "marksman",
    --Linter:
    "markdownlint",
    --Formater:
    --prettierd

    --Bash
    -- LSP:
    "bash-language-server",
    -- Linter:
    "shellcheck",
    -- Formatter:
    "shfmt",
  },
  auto_update = false,
  run_on_start = true,
  --  start_delay = 1000,
  --  debounce_hours = 24,

  integrations = {
    ["mason-lspconfig"] = true,
    ["mason-null-ls"] = true,
    ["mason-nvim-dap"] = true,
  },
}
