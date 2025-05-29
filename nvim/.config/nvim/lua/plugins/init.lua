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
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {},
  },

  --colors utility
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPost",
    config = function()
      require("configs.colorizer").setup()
    end,
  },
  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
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
  --package manager for lsp linters debuggers etc.

  --lsp integration plugins
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lsp-config"
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
        "onsails/lspkind.nvim",
      },

      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require("configs.luasnip").setup()
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
      return require "configs.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
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
      local dap = require "dap"
      local dapui = require "dapui"

      require("dapui").setup {}
      require("nvim-dap-virtual-text").setup {
        commented = true,
        display_callback = function(variable)
          --censor secret keys in output
          local name = string.lower(variable.name)
          local value = string.lower(variable.value)
          if name:match "secret" or name:match "api" or value:match "secret" or value:match "api" then
            return "*****"
          end

          if #variable.value > 15 then
            return " " .. string.sub(variable.value, 1, 15) .. "... "
          end

          return " " .. variable.value
        end,
      }

      vim.fn.sign_define("DapBreakpoint", {
        text = "🛑",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapStopped", {
        text = "🎯",
        texthl = "DiagnosticSignInfo",
        linehl = "Visual",
        numhl = "DiagnosticSignInfo",
      })

      vim.fn.sign_define("DapBreakpointCondition", {
        text = "🔥",
        texthl = "DiagnosticSignWarn",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapLogPoint", {
        text = "🚀",
        texthl = "DiagnosticSignInfo",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapBreakpointRejected", {
        text = "🐞",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      -- Open dapui when debugging starts
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      -- Close dapui on any termination (manual or normal exit)
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.disconnect["dapui_config"] = function()
        dapui.close()
      end

      --list debuggers

      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",

          args = {
            "/Users/oskalbarczyk/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
      }

      for _, language in ipairs { "typescript", "javascript", "javascriptreact", "typescriptreact" } do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
            runtimeExecutable = "node",
          },
        }
      end
    end,
  },

  --TODO: Neotest https://github.com/nvim-neotest/neotest
  --JavaScript/Typescript/TSX/JSX  tests : Jest,Vitetest
  --PHP tests: PHPUnit
  --ANGULAR tests: Jasmine + Karma
  --VUE : Vitetest and Jest
  --TODO: Database https://github.com/kndndrj/nvim-dbee
}
