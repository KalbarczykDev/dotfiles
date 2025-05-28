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
