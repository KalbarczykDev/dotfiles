return {
  {
    event = "VeryLazy",
    "rcarriga/nvim-notify",
    config = function()
      require("configs.nvim-notify").setup()
    end,
  },
}
