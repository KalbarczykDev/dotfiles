local dap = require "dap"

dap.adapters.python = {
  type = "executable",
  command = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python",
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      local venv_path = os.getenv "VIRTUAL_ENV"
      if venv_path then
        return venv_path .. "/bin/python"
      else
        return "python3"
      end
    end,
  },
}
