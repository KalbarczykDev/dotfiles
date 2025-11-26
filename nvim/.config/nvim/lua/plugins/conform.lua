return {
  --Formaters manager
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 3000,
      },
      formatters_by_ft = {
        -- Frontend languages
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
        scss = { "prettierd" },

        -- Scripting languages
        lua = { "stylua" },
        python = { "black" },

        -- Shell
        sh = { "shfmt" },
        bash = { "shfmt" },

        -- Configs
        xml = { "xmlformatter" },
        json = { "prettierd" },
        json5 = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        toml = { "taplo" },

        --jvm
        java = { "google-java-format" },

        -- C/C++
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
    },
  },
}
