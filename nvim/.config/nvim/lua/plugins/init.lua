return {
  --utils
  "nvim-lua/plenary.nvim",
  "nvzone/volt",
  "nvzone/menu",
  "MunifTanjim/nui.nvim",
  --theme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
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
  --notications
  {
    "rcarriga/nvim-notify",
    config = function()
      require("configs.nvim-notify").setup()
    end,
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
  --spell warnings
  {
    "ravibrock/spellwarn.nvim",
    event = { "BufReadPost", "BufNewFile" },
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
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
      "jay-babu/mason-null-ls.nvim",
      "nvimtools/none-ls.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      registries = {
        "github:nvim-java/mason-registry",
        "github:mason-org/mason-registry",
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "User MasonReady",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require "configs.mason-tool-installer"
    end,
  },
  --lsp integration plugins
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lsp.init"
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {
        lightbulb = {
          enable = true,
          sign = true,
          virtual_text = false,
        },
      }
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  --linters integration to lsp
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.none-ls"
    end,
    dependencies = {

      "nvimtools/none-ls-extras.nvim",
    },
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
  --Fuzzy finder + gui
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope-ui-select.nvim",
      {
        "folke/noice.nvim",
        config = function()
          require "configs.noice"
        end,
        dependencies = {
          "MunifTanjim/nui.nvim",
          "rcarriga/nvim-notify",
        },
      },
    },
    config = function()
      require "configs.telescope"
    end,
  },
  --Syntax highlighting
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
  -- Display binary files in hex format
  {
    "RaafatTurki/hex.nvim",
    event = "BufReadPre",
    opts = {
      hide_hex = false,
      preferred_column = 80,
    },
  },
  --debuggers
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require "configs.dap.init"
    end,
  },

  --java support plugin
  {
    "nvim-java/nvim-java",
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
    },
  },
}
