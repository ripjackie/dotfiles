local lspconfig = require("lspconfig")
local config = require("plugins.configs.lspconfig")

local M = {}

M.default_lsp = function (server)
  lspconfig[server].setup({
    on_attach = config.on_attach,
    capabilities = config.capabilities
  })
end

M.lua_ls = function ()
  lspconfig.lua_ls.setup({
    on_attach = config.on_attach,
    capabilities = config.capabilities,
    settings = { Lua = {
      runtime = {
        version = "LuaJIT"
      },
      diagnostics = {
        globals = { "vim" }
      },
      hint = {
        enable = true,
        arrayIndex = "Auto",
        await = true,
        paramName = "All",
        paramType = true,
        semicolon = "SameLine",
        setType = false
      },
      workspace = {
        checkThirdParty = false,
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          [vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true
        },
        maxPreload = 10000,
        preloadFileSize = 1000
      }
    }}
  })
end

M.gopls = function ()
  lspconfig.gopls.setup({
    on_attach = config.on_attach,
    capabilities = config.capabilities,
    settings = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true
      }
    }
  })
end

M.pylsp = function ()
  lspconfig.pylsp.setup({
    on_attach = config.on_attach,
    capabilities = config.capabilities,
    settings = {
      pylsp = {

      }
    }
  })
end


M.default_null_ls = function (source_name, methods)
  require("mason-null-ls").default_setup(source_name, methods)
end

M.ruff_lint = function (_, _)
  local null_ls = require("null-ls")
  null_ls.register(null_ls.builtins.diagnostics.ruff)
end

return M
