return {
  --inline diagram rendering (mermaid) in the terminal
  {
    "3rd/diagram.nvim",
    ft = { "markdown", "mermaid" },
    dependencies = {
      {
        "3rd/image.nvim",
        opts = {
          backend = "kitty", -- wezterm speaks the kitty graphics protocol
          processor = "magick_cli", -- use imagemagick CLI, no luarocks magick rock needed
          integrations = {}, -- diagram.nvim drives rendering; leave image's own md/neorg off
          max_width = 100,
          max_height = 50,
          window_overlap_clear_enabled = true,
        },
      },
    },
    config = function()
      require("diagram").setup {
        integrations = {
          require "diagram.integrations.markdown",
        },
        renderer_options = {
          mermaid = {
            theme = "dark",
          },
        },
      }
    end,
  },
}
