return {
  "junnplus/lsp-setup.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "folke/neodev.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  },
  config = function()
    require("plugins.configs.lsp_setup")
  end,
}
