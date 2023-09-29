require("neodev").setup()
require("lsp-setup").setup({
    servers = {
        pyright = {},
        lua_ls = {
            settings = {
                Lua = {
                    workspace = {
                        checkThirdParty = false
                    }
                }
            }
        },
    }
})

