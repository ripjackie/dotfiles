if jit.arch == "arm64" then
  require("mason").setup({})
end

require("lsp-setup").setup({
  servers = {
    lua_ls = {},
    clangd = {},
    basedpyright = {}
  },
  on_attach = function()
  end
})
