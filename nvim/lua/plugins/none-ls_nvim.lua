return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local builtins = null_ls.builtins

    null_ls.setup({
      sources = {
        builtins.diagnostics.selene,
        builtins.formatting.clang_format
      }
    })
  end
}
