local null_ls = require("null-ls")
local opts = {}

local fmt = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local cmp = null_ls.builtins.completion

opts.sources = {
  lint.selene,
  fmt.stylua
}

return opts
