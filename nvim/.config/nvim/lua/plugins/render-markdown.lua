return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "quarto" },

    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },

    config = function()
      require("render-markdown").setup {
        completions = { lsp = { enabled = true } },
        render_modes = true,
        anti_conceal = {
          enabled = true,
          ignore = {
            code_background = false,
            sign = true,
          },
          above = 0,
          below = 0,
        },
      }
    end,
  },
}
