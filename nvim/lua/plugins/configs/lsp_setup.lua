require("neodev").setup({})
require("lsp-setup").setup({
  servers = {
    lua_ls = {},
    basedpyright = {},
    clangd = {},
  },
  on_attach = function()
  end
})
