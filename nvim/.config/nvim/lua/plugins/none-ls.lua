return {
  --linters integration to lsp
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local null_ls = require "null-ls"
      local notify = require("utils").notify

      local eslint_root_files = {
        ".eslintrc",
        ".eslintrc.js",
        ".eslintrc.json",
        ".eslintrc.cjs",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        "eslint.config.js",
        "eslint.config.mjs",
        "eslint.config.cjs",
      }

      local js_langs = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      }

      local phpcs_root_files = {
        "phpcs.xml",
        ".phpcs.xml",
        "phpcs.xml.dist",
      }

      null_ls.setup {
        sources = {
          -- JS/TS
          require("none-ls.diagnostics.eslint_d").with {
            condition = function(utils)
              if not vim.tbl_contains(js_langs, vim.bo.filetype) then
                return false
              end
              local enabled = utils.root_has_file(eslint_root_files)
              if not enabled then
                notify("null-ls", "ESLint skipped — no config found", vim.log.levels.WARN)
              end
              utils.notify("null-ls", "ESLint diagnostics enabled")
              return enabled
            end,
          },
          require("none-ls.code_actions.eslint_d").with {
            condition = function(utils)
              if not vim.tbl_contains(js_langs, vim.bo.filetype) then
                return false
              end
              local enabled = utils.root_has_file(eslint_root_files)
              if not enabled then
                notify("null-ls", "ESLint code actions skipped", vim.log.levels.WARN)
              else
                notify("null-ls", "ESLint code actions enabled")
              end
              return enabled
            end,
          },

          -- PHP / Laravel
          null_ls.builtins.diagnostics.phpstan.with {
            condition = function(utils)
              if vim.bo.filetype ~= "php" then
                return false
              end

              local has_vendor = vim.fn.filereadable "vendor/bin/phpstan" == 1
              local has_config = utils.root_has_file { "phpstan.neon", "phpstan.neon.dist" }

              if not has_vendor or not has_config then
                notify("PHPStan skipped — missing config or vendor/bin/phpstan", vim.log.levels.WARN)
                return false
              end

              notify("null-ls", "PHPStan diagnostics enabled")
              return true
            end,
            command = "vendor/bin/phpstan",
          },

          null_ls.builtins.diagnostics.phpcs.with {
            condition = function(utils)
              if vim.bo.filetype ~= "php" then
                return false
              end
              local enabled = utils.root_has_file(phpcs_root_files)
              if not enabled then
                notify("PHPCS skipped — no config found", vim.log.levels.WARN)
              else
                notify "PHPCS diagnostics enabled"
              end
              return enabled
            end,
          },
          -- CSS / SCSS
          null_ls.builtins.diagnostics.stylelint,

          -- SQL
          null_ls.builtins.diagnostics.sqlfluff.with {

            extra_args = { "--dialect", "mysql" }, --NOTE: you have to manually set up here the dialect
          },

          -- YAML
          null_ls.builtins.diagnostics.yamllint,

          -- Markdown
          null_ls.builtins.diagnostics.markdownlint,

          --shell
          --shellcheck not needed expicite

          --lua
          require("none-ls-luacheck.diagnostics.luacheck").with {
            condition = function(utils)
              if vim.bo.filetype ~= "lua" then
                return false
              end

              local enabled = utils.root_has_file "/nvim/.config/nvim/.luacheckrc" --HACK: workaround the fact the root for this project is .dotfiles

              if not enabled then
                notify("null-ls", "luacheck skipped — no config found", vim.log.levels.WARN)
              else
                notify("null-ls", "luacheck diagnostics enabled")
              end
              return enabled
            end,
            extra_args = function()
              local root = require("null-ls.utils").get_root()
              return { "--config", root .. "/.luacheckrc" }
            end,
            cwd = function()
              return require("null-ls.utils").get_root()
            end,
          },
        },
      }
    end,
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
      "gbprod/none-ls-luacheck.nvim",
    },
  },
}
