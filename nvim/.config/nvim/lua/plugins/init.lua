return {
  --utility plugins
  "nvim-lua/plenary.nvim",
  "nvzone/volt",
  "nvzone/menu",
  "MunifTanjim/nui.nvim",
  --additional icons
  "nvim-tree/nvim-web-devicons",

  --spell warnings
  {
    "ravibrock/spellwarn.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.spellwarn"
    end,
  },
  --git status information
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    opts = {
      signs = {
        delete = { text = "󰍵" },
        changedelete = { text = "󱕖" },
      },
    },
  },

  --TODO: Move every plugin to separate file
  --TODO: Neotest https://github.com/nvim-neotest/neotest
  --JavaScript/Typescript/TSX/JSX  tests : Jest,Vitetest
  --PHP tests: PHPUnit
  --ANGULAR tests: Jasmine + Karma
  --VUE : Vitetest and Jest
  --TODO: Database https://github.com/kndndrj/nvim-dbee
}
