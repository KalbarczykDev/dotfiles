return {
  --terminals inside neovim
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm", "TermSelect", "ToggleTermToggleAll" },
    opts = {
      open_mapping = false, -- keymaps live in mappings.lua
      direction = "float",
      float_opts = { border = "curved" },
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return math.floor(vim.o.columns * 0.4)
        end
      end,
      persist_size = true,
      persist_mode = true,
      start_in_insert = true,
    },
  },
}
