local dap = require "dap"
local dapui = require "dapui"

require("dapui").setup {}
require("nvim-dap-virtual-text").setup {
  commented = true,
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
require "configs.dap.debuggers.codelldb"
