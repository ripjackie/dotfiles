return {
  "nvimtools/none-ls.nvim",
  event = "LspAttach",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
    "jay-babu/mason-null-ls.nvim"
  },
  config = function()
    require("config.null_ls")
  end
}
