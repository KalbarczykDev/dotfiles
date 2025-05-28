local M = {}

M.setup = function()
  local dap = require "dap"
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
end

return M
