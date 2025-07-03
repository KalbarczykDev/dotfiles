return {
  --Package manager
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup {
        PATH = "skip",
        ui = {
          icons = {
            package_pending = " ",
            package_installed = " ",
            package_uninstalled = " ",
          },
        },
        max_concurrent_installers = 10,
      }

      vim.schedule(function()
        vim.api.nvim_exec_autocmds("User", { pattern = "MasonReady" })
      end)
    end,
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
      "jay-babu/mason-null-ls.nvim",
      "nvimtools/none-ls.nvim",
      "mfussenegger/nvim-dap",
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        event = "User MasonReady",
        dependencies = {
          "williamboman/mason.nvim",
        },
        config = function()
          require("mason-tool-installer").setup {
            ensure_installed = {

              --JavaScript/TypeScript/TSX AND JSX
              --LSP:
              "typescript-language-server",
              --DAP:
              "js-debug-adapter", --node
              "chrome-debug-adapter", --browser
              --Linter:
              "eslint_d",
              --Formater:
              "prettierd",

              --PHP/Laravel/Blade
              --LSP:
              "phpactor",
              --DAP:
              -- "php-debug-adapter", installed manually
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
              --"stylelint",
              --Formater:
              --prettierd

              --Lua
              --LSP:
              "lua-language-server",
              --Linter:
              "luacheck",
              --Formater:
              "stylua",

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

              --Python
              -- LSP:
              "basedpyright",
              -- Linter:
              "ruff",
              -- Formatter:
              "black",

              --java
              --lsp
              "jdtls",
              --test
              "java-test",
              --dap
              "java-debug-adapter",
              --Formater
              "google-java-format",
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
        end,
      },
    },
  },
}
