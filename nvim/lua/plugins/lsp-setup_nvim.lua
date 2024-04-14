return {
  "junnplus/lsp-setup.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "folke/neodev.nvim",
    "folke/neoconf.nvim"
  },
  config = function()
    require("plugins.configs.lsp-setup_nvim")
  end
}
