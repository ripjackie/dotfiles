return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvimtools/none-ls.nvim",
		"williamboman/mason.nvim",
	},
	opts = {
		ensure_installed = nil,
		automatic_installation = true,
	},
}
