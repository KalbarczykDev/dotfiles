return {
  --lsp integration plugins
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local severity_icons = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.HINT] = "",
        [vim.diagnostic.severity.INFO] = "",
      }

      local capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      )

      vim.diagnostic.config {
        virtual_text = true,

        signs = {
          text = severity_icons,
        },
        underline = true,
        update_in_insert = true,
        severity_sort = true,
      }

      -- shared defaults applied to every server (nvim 0.11 native API)
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- per-server overrides; servers without overrides are just enabled below
      local overrides = {
        clangd = {
          cmd = { "clangd", "--background-index", "--clang-tidy" },
        }, --c/cpp
        marksman = {
          filetypes = { "markdown" },
        }, --markdown
        basedpyright = {
          settings = {
            basedpyright = {
              diagnosticMode = "openFilesOnly",
              inlayHints = {
                variableTypes = true,
                functionReturnTypes = true,
                callArgumentNames = true,
              },
              typeCheckingMode = "basic",
              reportUnknownMemberType = "none",
              reportMissingTypeStubs = "none",
              reportPrivateImportUsage = "none",
              reportUnusedImport = "warning",
              reportUnusedVariable = "information",

              autoImportCompletions = true,
            },
            python = {
              venvPath = ".",
              venv = ".venv",
            },
          },
        }, --python
      }
      for name, cfg in pairs(overrides) do
        vim.lsp.config(name, cfg)
      end

      vim.lsp.enable {
        "clangd", --c/cpp
        "ts_ls", --JS/TS/TSX and JSX
        "angularls", --angular
        "html", --html
        "emmet_ls", --html snippets
        "lua_ls", --lua
        "cssls", --css/scss
        "lemminx", --xml
        "yamlls", --yaml
        "jsonls", --json
        "taplo", --toml
        "marksman", --markdown
        "bashls", --shell
        "dockerls", --dockerfile
        "docker_compose_language_service", --docker compose
        "phpactor", --php
        "basedpyright", --python
      }

      -- enable inlay hints once a server that supports them attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
          end
        end,
      })
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {
        lightbulb = {
          enable = true,
          sign = false,
          virtual_text = true,
        },
      }
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
