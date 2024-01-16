local vim = vim

require("neodev").setup({})
require("lsp-setup").setup({
  inlay_hints = {
    enabled = true
  },
  servers = {
    lua_ls = {
      settings = {
        Lua = {
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
        }
      }
    }
  }
})
