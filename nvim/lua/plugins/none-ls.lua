return {
  "nvimtools/none-ls.nvim",
  event = "LspAttach",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("configs.null_ls")
  end
}
