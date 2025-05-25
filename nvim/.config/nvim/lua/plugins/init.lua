return {
  "nvim-lua/plenary.nvim",
  "nvzone/volt",
  "nvzone/menu",
  --colors utility
  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
  },
  --aditional iccons
  "nvim-tree/nvim-web-devicons",
  --indentation lines
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    opts = {
      indent = { char = "│" },
      scope = { char = "│" },
    },
  },
  --file tree
  {
    "nvim-tree/nvim-tree.lua",
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
  --git status information
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    opts = function()
      --TODO config
    end,
  },
  --package manager for lsp linters debuggers etc.
  {
    "williamboman/mason.nvim",
    config = function()
      require "configs.mason"
    end,
  },
  --lsp integration plugin
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lsp.init"
    end,
  },
  --Code completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {

      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          --  TODO config
        end,
      },
      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    config = function()
      require("configs.cmp").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      require "configs.telescope"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      --TODO CONFIG  return require "nvchad.configs.treesitter"
    end,
    config = function(_, opts)
      --TODO OPTS     require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
