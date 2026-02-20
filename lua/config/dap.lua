local dap = require("dap")
-- local dapui = require("dapui")
--
--
-- dapui.setup()
-- require("nvim-dap-virtual-text").setup()
--
-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open()
-- end
--
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
--
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "gdb",
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp
