return {
  --Formaters manager
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
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
        php = { "php_cs_fixer" },

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

        -- Docker (compose files use the yaml.docker-compose filetype)
        ["yaml.docker-compose"] = { "prettierd" },

        -- C/C++
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
    },
  },
}
