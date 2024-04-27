local plugins = {
	{
		"zaldih/themery.nvim",
    dependencies = require("configs.themery").depends,
		opts = {
			livePreview = true,
			themeConfigFile = vim.fn.stdpath("config") .. "/lua/core/theme.lua",
			themes = require("configs.themery").configs
		}
	},

	{
		"junnplus/lsp-setup.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim"
		},
		config = function()
			require("configs.lsp-setup")
		end
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("configs.treesitter")
		end
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip"
    },
		config = function()
			require("configs.nvim-cmp")
		end
	},

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    opts = {}
  },

  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    version = "*",
    opts = {}
  }

}

return plugins
