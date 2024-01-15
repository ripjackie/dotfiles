local plugins = {
	spec = {},
	unspec = {},
	add = function(self, v)
		table.insert(self.spec, v)
	end,
	del = function(self, v)
		table.insert(self.unspec, v)
	end,
	out = function(self)
		return self.spec
	end,
}

plugins:add({
	"zaldih/themery.nvim",
	cmd = "Themery",
	dependencies = {
		"sainnhe/everforest",
	},
	opts = {
		themes = require("configs.themery"),
		themeConfigFile = "~/.config/nvim/lua/theme.lua",
		livePreview = true,
	},
})

plugins:add({
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
})

plugins:add({
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = function()
		return require("configs.null-ls")
	end,
})

plugins:add({
	"williamboman/mason.nvim",
	lazy = false,
	opts = {},
})

plugins:add({
	"williamboman/mason-lspconfig.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
	},
})

plugins:add({
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
})

plugins:add({
	"junnplus/lsp-setup.nvim",
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
})

plugins:add({
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
})

plugins:add({
	"folke/twilight.nvim",
	cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
	opts = {},
})

plugins:add({
	"altermo/ultimate-autopair.nvim",
	event = { "InsertEnter", "CmdlineEnter" },
	branch = "v0.6",
	opts = {
		tabout = { enable = true },
	},
})

plugins:add({
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
})

return plugins:out()
