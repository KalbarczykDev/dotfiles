return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap.init"
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {
      virt_text_win_col = 80,
    },
  },
}
