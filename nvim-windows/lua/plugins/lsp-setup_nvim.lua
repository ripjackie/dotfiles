return {
  "junnplus/lsp-setup.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    {
      "williamboman/mason-lspconfig.nvim",
      cond = jit.arch ~= "arm64" and true or false
    }
  },
  config = function ()
    require("plugins.configs.lsp_setup")
  end
}
