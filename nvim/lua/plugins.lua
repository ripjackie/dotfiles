--lazy.nvim plugins
require("lazy").setup({
	-- nvim-cmp
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            "glepnir/lspsaga.nvim"
        }
    },
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',

	-- luasnip
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',

	-- nvim-autopairs
	{
		'windwp/nvim-autopairs',
		config = function()
            require("nvim-autopairs").setup{}
        end
	},

    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup{
                space_char_blankline = " ",
                show_current_context = true,
                show_current_context_start = true,
        		use_treesitter = true,
        		show_trailing_blankline_indent = false
            }
        end
    },

	-- nvim-treesitter
	{
		'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup{
                highlight = {enable = true},
                indent = {enable = true}
            }
        end
	},

    -- mason
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup{}
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup{}
        end
    },

    "mfussenegger/nvim-dap",
    "nvim-lua/plenary.nvim",
    "jose-elias-alvarez/null-ls.nvim",

    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup{}
        end,
        dependencies = {
            {"nvim-tree/nvim-web-devicons"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    },


    -- tokyo night theme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {}
    },

    -- barbecue
    {
	    "utilyre/barbecue.nvim",
	    event = "VeryLazy",
	    dependencies = {
		    "neovim/nvim-lspconfig",
		    "SmiteshP/nvim-navic",
		    "nvim-tree/nvim-web-devicons",
            "folke/tokyonight.nvim"
	    },
	    config = function()
            require("barbecue").setup{
                theme = "tokyonight"
            }
        end
    },

    -- lualine
    {
	    "nvim-lualine/lualine.nvim",
	    event = "VeryLazy",
	    requires = {
		    "nvim-tree/nvim-web-devicons"
	    },
        config = function ()
            require("lualine").setup{
                options = {theme = "tokyonight"}
            }
            -- load theme
            require("evil_lualine")
        end
    },

    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup{}
        end,
        dependencies = {
            {"nvim-tree/nvim-web-devicons"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    },

    -- git signs
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup{}
        end
    }
})
