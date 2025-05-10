return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    config = function() end,
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
}
