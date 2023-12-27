local opts = {
    inlay_hints = { enabled = true },
    servers = {
        lua_ls = {
            settings = {
                Lua = {
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
                    }
                }
            }
        },
        pyright = {}
    }
}

return opts
