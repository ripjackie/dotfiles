return {
  "junnplus/lsp-setup.nvim",
  lazy = false,
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim"
  },
  config = function()
    require("config.lsp_setup")
  end
}
