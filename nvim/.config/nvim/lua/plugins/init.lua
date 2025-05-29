return {
  --utility plugins
  "nvim-lua/plenary.nvim",
  "nvzone/volt",
  "nvzone/menu",
  "MunifTanjim/nui.nvim",
  --additional icons
  "nvim-tree/nvim-web-devicons",

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("configs.lualine").setup()
    end,
  },

  --indentation lines
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("configs.indentline").setup()
    end,
  },
  --notifications
  {
    "rcarriga/nvim-notify",
    config = function()
      require("configs.nvim-notify").setup()
    end,
  },

  --file tree
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
      { "<leader>e", "<cmd>NvimTreeFocus<CR>", desc = "Focus NvimTree" },
    },
    config = function()
      require("configs.nvimtree").setup()
    end,
  },
  --keys cheatsheat
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    opts = {},
  },
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
