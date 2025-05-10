local none_ls = require "null-ls"
local on_attach = require "configs.lsp.on_attach"

local formatting = none_ls.builtins.formatting
local diagnostics = none_ls.builtins.diagnostics

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

    diagnostics.mypy.with {
      filetypes = { "python" },
    },

    require("none-ls.code_actions.eslint").with {
      filetypes = {
        "javascript",
        "typescript",
        "typescriptreact",
        "javascriptreact",
      },
    },
  },

  on_attach = on_attach,
}
