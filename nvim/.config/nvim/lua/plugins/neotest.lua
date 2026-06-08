return {
  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
      "olimorris/neotest-phpunit",
      "nvim-neotest/neotest-python",

      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      --find jest config
      local function find_jest_config()
        local configs = vim.fn.glob("*.jest.config.*", false, true)
        if #configs > 0 then
          return vim.fn.fnamemodify(configs[1], ":t")
        end
        return nil
      end

      --use project .venv python if present, else system python
      local function python_path()
        local venv = vim.fn.getcwd() .. "/.venv/bin/python"
        if vim.fn.executable(venv) == 1 then
          return venv
        end
        return "python"
      end

      require("neotest").setup {

        output = {
          enabled = true,
          open_on_run = true,
          open_on_failure = true,
        },

        adapters = {

          --TODO: Fix tests for python
          require "neotest-python" {
            python = python_path(),
          },
          require "neotest-jest" {
            jestCommand = "npm test --",
            jestConfigFile = find_jest_config(),
            env = { CI = true },
            cwd = function()
              return vim.fn.getcwd()
            end,
          },
          require "neotest-vitest",
          require "neotest-phpunit" {
            dap = {
              type = "php",
              request = "launch",
              name = "Debug PHPUnit (neotest)",
              port = 9003,
            },
          },
        },
      }
    end,
  },
}
