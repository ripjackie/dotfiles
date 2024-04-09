return {
  "mfussenegger/nvim-dap",
  event = "LspAttach",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    require("ripjackie.plugins.configs.dapconfigs")
  end
}
