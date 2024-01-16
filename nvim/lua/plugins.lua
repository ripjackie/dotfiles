local M = {
	{
		"zaldih/themery.nvim",
		cmd = "Themery",
		dependencies = {
			"sainnhe/everforest",
		},
		opts = {
			themes = require("configs.themery"),
			themeConfigFile = vim.fn.stdpath("config") .. "/lua/theme.lua",
			livePreview = true,
		},
	},

	{
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
	},

	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = function()
			return require("configs.null-ls")
		end,
	},

	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
		},
	},

	{
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
	},

	{
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
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},

	{
		"folke/twilight.nvim",
		cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
		opts = {},
	},

	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
		opts = {
			tabout = { enable = true },
		},
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
}

return M
