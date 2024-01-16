return {
	"junnplus/lsp-setup.nvim",
	lazy = false,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"folke/neodev.nvim",
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function(_, opts)
		require("neodev").setup()
		require("lsp-setup").setup(opts)
	end,
	opts = require("configs.lsp-setup"),
}
