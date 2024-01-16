return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		-- "hrsh7th/cmp-path",
		"FelipeLema/cmp-async-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-calc",
		"onsails/lspkind.nvim",

		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},

	config = function()
		require("configs.cmp")
	end,
}
