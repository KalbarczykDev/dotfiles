return {
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("configs.nvimtree").setup()
    end,
  },
}
