require("mason-tool-installer").setup {
  ensure_installed = {
    -- LSPs
    "lua-language-server",        -- Lua
    "clangd",                     -- C/C++
    "pyright",                    -- Python
    "jdtls",                      -- Java
    "lemminx",                    -- XML
    "yaml-language-server",       -- YAML
    "typescript-language-server", -- JavaScript/TypeScript
    "angular-language-server",    -- Angular
    "html-lsp",                   -- HTML
    "css-lsp",                    -- CSS
    "json-lsp",                   -- JSON
    "emmet_ls",                   -- Emmet (HTML, JSX)
    "vue-language-server",        -- Vue
    "svelte-language-server",     -- Svelte
    "astro-language-server",      -- Astro
    -- Formatters
    "stylua",                     -- Lua
    "prettierd",                  -- JS/TS, HTML, CSS, etc.
    "black",                      -- Python
    "clang-format",               -- C/C++
    "google-java-format",         -- Java

    -- Linters
    "ruff",     --Python
    "mypy",     -- Python
    "eslint_d", -- JS/TS

    -- Debuggers
    "codelldb",           -- C/C++
    "debugpy",            -- Python
    "java-debug-adapter", -- Java
    "java-test",          -- Java Testing
    "js-debug-adapter",   -- JS/TS
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
