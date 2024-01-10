local config = require("plugins.configs.lspconfig")

require("neodev").setup({
	library = {
		enabled = true,
		types = true,
		runtime = true,
		plugins = true,
	},
})

require("lsp-setup").setup({
	default_mappings = false,
	inlay_hints = { enabled = true },
	on_attach = config.on_attach,
	capabilities = config.capabilities,

	servers = {
		lua_ls = {
			settings = {
				Lua = {
					format = {
						enable = true,
						defaultConfig = {
							indent_style = "space",
							indent_size = "4",
						},
					},
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
					hint = {
						enable = true,
						arrayIndex = "Auto",
						await = true,
						paramName = "All",
						paramType = true,
						semicolon = "SameLine",
						setType = false,
					},
					workspace = {
						checkThirdParty = false,
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
							[vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types"] = true,
							[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
						},
						maxPreload = 10000,
						preloadFileSize = 1000,
					},
				},
			},
		},
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
})
