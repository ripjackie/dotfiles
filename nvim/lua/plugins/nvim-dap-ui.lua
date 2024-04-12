return {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    require("plugins.configs.dapconfigs")
    require("dapui").setup()
  end
}
