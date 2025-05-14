local none_ls = require "null-ls"
local on_attach = require "configs.lsp.on_attach"

local formatting = none_ls.builtins.formatting
local diagnostics = none_ls.builtins.diagnostics

local eslint_d = require "none-ls.diagnostics.eslint_d"
local eslint_code_actions = require "none-ls.code_actions.eslint_d"

none_ls.setup {
  sources = {
    -- FORMATTERS
    formatting.stylua.with {
      filetypes = { "lua" },
    },

    formatting.black.with {
      filetypes = { "python" },
    },
    formatting.google_java_format.with {
      filetypes = { "java" },
    },

    formatting.prettierd.with {
      filetypes = {
        "javascript",
        "typescript",
        "typescriptreact",
        "javascriptreact",
        "vue",
        "svelte",
        "astro",
        "css",
        "html",
        "json",
        "yaml",
        "markdown",
        "xml",
      },
    },

    -- LINTERS / DIAGNOSTICS

    --Python
    diagnostics.mypy.with {
      filetypes = { "python" },
    },

    -- JS/TS
    eslint_d,
    eslint_code_actions,
  },
  on_attach = on_attach,
}
