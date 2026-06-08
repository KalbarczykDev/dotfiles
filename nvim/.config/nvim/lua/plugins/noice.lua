return {
  --cmdline / messages / popupmenu UI
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup {
        lsp = {
          hover = {
            enabled = false,
          },
          signature = {
            enabled = false,
          },
          progress = {
            enabled = false,
          },
        },
      }
    end,
  },
}
