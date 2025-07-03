return {
  --debugger
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
      --[[ ── PHP Debug Setup ──
      -- NOTE: For a new device setup
      --
      -- 1. Clone the project repository and build dependencies
      --
      -- 2. Install Xdebug:
      --      pecl install xdebug
 
-      -- 3. Run the PHP script with Xdebug enabled (check the function in zsh) :
      --  IMPORTANT:
      --    Always run `:lua require'dap'.continue()` in Neovim
      --    BEFORE launching the PHP script to allow Xdebug to connect.
--]]
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { os.getenv "HOME" .. "/vscode-php-debug/out/phpDebug.js" },
      }

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
        },
      }

      -- ── JS/TS Debug Setup ──
      -- NOTE: Must build the adapters before first use
      --
      -- 1. Install the adapter (via Mason):
      --      :MasonInstall js-debug-adapter
      --      :MasonInstall chrome-debug-adapter
      --
      -- 2. Build the JS Debug Adapter:
      --      cd ~/.local/share/nvim/mason/packages/js-debug-adapter
      --      npm install --legacy-peer-deps
      -- 3.  Build the Chrome Debug Adapter:
      --     cd ~/.local/share/nvim/mason/packages/chrome-debug-adapter
      --     npm install --legacy-peer-deps
      --     npm run build
      --
      -- 4. Confirm the path to the adapter:
      --      ~/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js
      --

      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = {
            os.getenv "HOME" .. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
      }

      --Chmrome debugger usage
      --set breakpoint
      --run app eg npx serve .
      --open chrome with debug flags (look zsh alias)
      --dap continue and select "Attach to chrome" in the prompt

      dap.adapters.chrome = {
        type = "executable",
        command = "node",
        args = { os.getenv "HOME" .. "/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" },
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
          {
            name = "Attach to chrome",
            type = "chrome",
            request = "attach",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = "inspector",
            port = 9222,
            webRoot = "${workspaceFolder}",
          },
        }
      end
    end,
  },
}

--TODO: Add debugger for python
