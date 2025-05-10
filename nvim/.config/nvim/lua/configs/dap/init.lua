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

--list debuggers
require "configs.dap.debuggers.codelldb"
require "configs.dap.debuggers.python"
