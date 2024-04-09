return {
  "junnplus/lsp-setup.nvim",
  lazy = false,
  dependencies = {
    "neovim/nvim-lspconfig",
    { "williamboman/mason.nvim",           opts = {} },
    { "williamboman/mason-lspconfig.nvim", cond = not vim.g.mobile },
    "folke/neodev.nvim",
    "folke/neoconf.nvim"
  },
  config = function()
    require("ripjackie.plugins.configs.lspconfigs")
  end
}
