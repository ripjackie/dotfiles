local opts = {}

opts.inlay_hints = {
	enabled = true,
}
opts.on_attach = function() end

opts.default_mappings = false

opts.servers = {
	lua_ls = {
		settings = {
			Lua = {
				hint = {
					enable = true,
					arrayIndex = "Auto",
					await = true,
					paramName = "All",
					paramType = true,
					semicolon = "SameLine",
					setType = false,
				},
			},
		},
	},
}

return opts
