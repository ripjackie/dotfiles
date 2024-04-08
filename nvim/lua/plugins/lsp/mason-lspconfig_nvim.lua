return {
  "williamboman/mason-lspconfig.nvim",
  lazy = false,
  cond = not vim.g.mobile,
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim"
  }
}
