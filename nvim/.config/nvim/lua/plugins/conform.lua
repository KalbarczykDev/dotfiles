return {
  --Formaters manager
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 1500,
      },
      formatters_by_ft = {
        -- JavaScript / TypeScript / JSX / TSX / Vue / Angular
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        vue = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
        scss = { "prettierd" },
        json = { "prettierd" },
        json5 = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },

        -- PHP / Laravel / Blade
        php = { "pint" },
        blade = { "blade-formatter" },

        -- Lua
        lua = { "stylua" },

        -- Bash
        sh = { "shfmt" },
        bash = { "shfmt" },

        -- XML
        xml = { "xmlformatter" },

        -- TOML
        toml = { "taplo" }, -- taplo has native formatter

        --java
        java = { "google-java-format" },
      },
    },
  },
}
