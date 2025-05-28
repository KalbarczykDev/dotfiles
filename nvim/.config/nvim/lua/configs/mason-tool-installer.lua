require("mason-tool-installer").setup {
  ensure_installed = {
    -- LSPs
    "lua-language-server",        -- Lua
    "jdtls",                      -- Java
    "lemminx",                    -- XML
    "yaml-language-server",       -- YAML
    "typescript-language-server", -- JavaScript/TypeScript
    "angular-language-server",    -- Angular
    "html-lsp",                   -- HTML
    "css-lsp",                    -- CSS
    "json-lsp",                   -- JSON
    "emmet_ls",                   -- Emmet (HTML, JSX)
    "bashls",                     --Bash
    "taplo",                      -- toml

    -- Formatters
    "stylua",             -- Lua
    "prettierd",          -- JS/TS, HTML, CSS, etc.
    "google-java-format", -- Java

    -- Linters
    "eslint_d", -- JS/TS

    -- Debuggers
    "java-debug-adapter", -- Java
    "js-debug-adapter",   -- JS/TS

    --Test
    "java-test", -- Java Testing
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
