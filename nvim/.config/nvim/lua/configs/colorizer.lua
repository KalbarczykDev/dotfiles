local M = {}
M.setup = function()
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

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
      -- safe require and attach
      local ok, c = pcall(require, "colorizer")
      if ok then
        c.attach_to_buffer(args.buf)
      end
    end,
  })
end

return M
