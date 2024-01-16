return {
	"zaldih/themery.nvim",
	cmd = "Themery",
	dependencies = {
		"sainnhe/everforest",
		"sainnhe/sonokai",
		"sainnhe/edge",
	},
	opts = {
		themes = require("configs.themery"),
		themeConfigFile = vim.fn.stdpath("config") .. "/lua/theme.lua",
		livePreview = true,
	},
}
