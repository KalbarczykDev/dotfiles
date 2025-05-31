return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      {
        --NOTE: run this command before using on new device :NeotestJava setup
        "rcasia/neotest-java",
        ft = "java",
        dependencies = {
          "mfussenegger/nvim-jdtls",
          "mfussenegger/nvim-dap",
          "rcarriga/nvim-dap-ui",
          "theHamsta/nvim-dap-virtual-text",
        },
      },
      "nvim-neotest/neotest-jest",

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

      require("neotest").setup {
        adapters = {
          require "neotest-java",
          require "neotest-jest" {
            jestCommand = "npm test --",
            jestConfigFile = find_jest_config(),
            env = { CI = true },
            cwd = function()
              return vim.fn.getcwd()
            end,
          },
          require "neotest-jest",
        },
      }
    end,
  },
}
