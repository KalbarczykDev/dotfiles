return {
  --highlighting todos
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    config = function()
      require("todo-comments").setup {
        signs = true,
        sign_priority = 8,

        keywords = {
          FIX = {
            icon = " ",
            color = "error",
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
          },
          TODO = { icon = "󱃕 ", color = "info", alt = { "TD" } },
          HACK = { icon = "󱗗 ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = "󱤎 ", color = "performance", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = "󰎚 ", color = "hint", alt = { "INFO" } },
          TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },

        gui_style = {
          fg = "NONE",
          bg = "BOLD",
        },

        merge_keywords = true,

        highlight = {
          multiline = true,
          multiline_pattern = "^.",
          multiline_context = 10,
          before = "",
          keyword = "wide",
          after = "fg",
          pattern = [[.*<(KEYWORDS)\s*:]],
          comments_only = true,
          max_line_len = 400,
          exclude = {},
        },

        colors = {
          error = { "#F38BA8" }, -- red
          warning = { "#F9E2AF" }, -- yellow
          info = { "#89B4FA" }, -- blue
          hint = { "#94E2D5" }, -- teal
          performance = { "#FAB387" }, -- peach
          test = { "#CBA6F7" }, -- lavender
          default = { "#BAC2DE" }, -- subtext1
        },

        search = {
          command = "rg",
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
          },
          pattern = [[\b(KEYWORDS):]],
        },
      }
    end,
    opts = {},
  },
}
