local neodev = require("neodev")
local lsp_setup = require("lsp-setup")

neodev.setup({})
lsp_setup.setup({
    servers = {
        pyright = {},
        lemminx = {
            settings = {
                xml = {
                    server = {
                        workDir = "~/.cache/lemminx"
                    }
                }
            }
        },
        lua_ls = {
            settings = {
                Lua = {
                    workspace = {
                        checkThirdParty = false,
                        maxPreload = 500,
                        preloadFileSize = 500
                    },
                    completion = {
                        callSnippet = "Replace"
                    }
                }
            }
        }
    }
})
