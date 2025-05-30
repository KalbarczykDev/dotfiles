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
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-java",
        },
      }

      local neotest = require "neotest"

      vim.keymap.set("n", "<leader>tn", function()
        neotest.run.run() -- runs nearest test
      end, { desc = "Run nearest test" })

      vim.keymap.set("n", "<leader>tf", function()
        neotest.run.run(vim.fn.expand "%") -- runs current file
      end, { desc = "Run test file" })

      vim.keymap.set("n", "<leader>ts", neotest.summary.toggle, { desc = "Toggle test summary" })
      vim.keymap.set("n", "<leader>to", neotest.output.open, { desc = "Open test output" })
      vim.keymap.set("n", "<leader>dt", function()
        neotest.run.run { strategy = "dap" } -- debug nearest test
      end, { desc = "Debug nearest test" })
    end,
  },
}
