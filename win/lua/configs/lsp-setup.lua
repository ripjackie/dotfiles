require("lsp-setup").setup({
  servers = {
    lua_ls = {},
    basedpyright = {}
  },
  on_attach = function()
  end
})
