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
      "lukas-reineke/cmp-under-comparator",
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
  },

  {
    "christoomey/vim-tmux-navigator"
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    version = "v3.x.x",
		main = "ibl",
    opts = {}
  },

  {
    "folke/twilight.nvim",
    opts = {}
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {}
  },

	{
		"ggandor/leap.nvim",
	},

  {
    "kylechui/nvim-surround",
    opts = {}
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    },
    opts = {}
  },

  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
			"jay-babu/mason-null-ls.nvim",
    },
    config = function ()
      local ls = require("null-ls")
      local diag = ls.builtins.diagnostics
      local fmt = ls.builtins.formatting
      ls.setup({
        sources = {
          -- lua
          diag.selene,

          -- python
          fmt.isort,
          fmt.black,
        }
      })
    end
  },

  {
    "j-hui/fidget.nvim",
    opts = {}
  }
}

return plugins
