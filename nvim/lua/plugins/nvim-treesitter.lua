return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	dependencies = {
		"RRethy/nvim-treesitter-endwise",
	},
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		endwise = { enable = true },
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			"vim",
			"vimdoc",
			"markdown",
			"markdown_inline",
			"lua",
			"python",
			"go",
			"rust",
		},
	},
}
