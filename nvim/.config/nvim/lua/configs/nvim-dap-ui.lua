local dap = require "dap"
local dapui = require "dapui"
dapui.setup()
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
