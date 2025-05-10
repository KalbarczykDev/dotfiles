return {
  {
    "kosayoda/nvim-lightbulb",
    dependencies = "antoinemadec/FixCursorHold.nvim",
    event = "LspAttach",
    config = function()
      require("nvim-lightbulb").setup {
        autocmd = { enabled = true },
        sign = { enabled = true },
        virtual_text = { enabled = true },
        float = { enabled = false },
      }
    end,
  },
}
