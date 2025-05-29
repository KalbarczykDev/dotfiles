return {
  --indentation lines
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("ibl").setup {
        indent = {
          char = "│",
        },
        scope = {
          enabled = true,
          show_start = false,
          show_end = false,
          injected_languages = true,
          highlight = { "IblScope" },
          char = "│",
        },
        exclude = {
          filetypes = { "help", "lazy", "NvimTree", "alpha", "dashboard" },
          buftypes = { "terminal", "nofile" },
        },
      }
    end,
  },
}
