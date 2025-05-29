return {
  --colors utility
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPost",
    config = function()
      require("colorizer").setup {
        filetypes = { "*" }, -- or specifically { "lua", "css", "html", ... }
        user_default_options = {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          names = false, -- "blue" or "red" supported?
          css = true, -- Enable all CSS features: rgb(...), hsl(...)
          mode = "background", -- foreground | background | virtualtext
          tailwind = true,
        },
      }
    end,
  },
  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
  },
}
