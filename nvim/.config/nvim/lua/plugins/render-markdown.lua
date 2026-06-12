return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "quarto" },

    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },

    config = function()
      require("render-markdown").setup {
        completions = { lsp = { enabled = true } },
        render_modes = { "n", "c" },
        anti_conceal = { enabled = false },
      }
    end,
  },
}
