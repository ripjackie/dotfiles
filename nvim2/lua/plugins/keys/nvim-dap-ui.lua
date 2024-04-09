local dapui = require("dapui")
local dap = require("dap")

return {
  { "<leader>dt", dapui.toggle },
  { "<leader>db", dap.toggle_breakpoint },
  { "<leader>dc", dap.continue },
  { "<leader>do", dap.step_over },
  { "<leader>di", dap.step_into },
  { "<leader>dr", dap.repl.open }
}
