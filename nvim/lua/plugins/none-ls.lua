return {
  "nvimtools/none-ls.nvim",
  event = "LspAttach",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("plugins.configs.null_ls")
  end
}
