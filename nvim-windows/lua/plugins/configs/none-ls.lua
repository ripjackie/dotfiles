local null_ls = require("null-ls")
local diag = null_ls.builtins.diagnostics
local fmt = null_ls.builtins.formatting
null_ls.setup({
  sources = {
    -- lua
    diag.selene,

    -- python
    fmt.isort,
    fmt.black,
  }
})

require("mason-null-ls").setup({
  automatic_installation = true
})
