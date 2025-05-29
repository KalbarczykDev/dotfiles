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

      local cmp_lsp = require "cmp_nvim_lsp"
      local capabilities =
        vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())
      local lspconfig = require "lspconfig"
      local util = require "lspconfig.util"
      vim.diagnostic.config {
        virtual_text = true,

        signs = {
          text = severity_icons,
        },
        underline = true,
        update_in_insert = true,
        severity_sort = true,
      }

      local servers = {
        ts_ls = true, --JS/TS/TSX and JSX

        phpactor = {
          cmd = { "phpactor", "language-server" },
          filetypes = { "php" },
          root_dir = function(fname)
            return util.root_pattern("composer.json", ".git", ".phpactor.json", ".phpactor.yml", ".php")(fname)
              or util.path.dirname(fname)
          end,
        },
        --PHP/Laravel/Blade
        volar = true, --vue
        angularls = true, --angular
        html = true, --html
        emmet_ls = true, --html snippets
        lua_ls = true, --lua
        cssls = true, --css/scss
        sqls = true, --sql
        lemminx = true, --xml
        yamlls = true, --yaml
        jsonls = true, --json
        taplo = true, -- Toml
        marksman = true, --markdown
        bashls = true, --shell
      }

      for name, config in pairs(servers) do
        if config == true then
          config = {}
        end
        config = vim.tbl_deep_extend("force", {}, {
          capabilities = capabilities,
        }, config)

        lspconfig[name].setup(config)
      end
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {
        lightbulb = {
          enable = true,
          sign = true,
          virtual_text = false,
        },
      }
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
