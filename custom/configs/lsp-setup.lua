local config = require "plugins.configs.lspconfig"

require("neodev").setup {
  library = {
    enabled = true,
    types = true,
    runtime = true,
    plugins = true,
  },
}

require("lsp-setup").setup {
  default_mappings = false,
  inlay_hints = { enabled = true },
  on_attach = config.on_attach,
  capabilities = config.capabilities,

  servers = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
    pyright = {},
    pylsp = {},
  },
}
