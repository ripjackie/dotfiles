require("lazy").setup {
	{ 
        "neoclide/coc.nvim",
        branch = "release"
    },

	-- nvim-treesitter
	{ 
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            highlight = { enable  = true },
            indent = { enable =true },
        }
	},

    { 
        "nvim-lualine/lualine.nvim",
	    event = "VeryLazy",
	    requires = {
		    "nvim-tree/nvim-web-devicons"
	    },
        opts = {  theme = "neon" }
    },

    { 
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            space_char_blankline = " ",
            show_current_context = true,
            show_current_context_start = true,
            use_treesitter = true,
            show_trailing_blankline_indent = false
        }
    },

    -- barbecue
    {
        "utilyre/barbecue.nvim",
	    event = "VeryLazy",
	    dependencies = {
		    "SmiteshP/nvim-navic",
		    "nvim-tree/nvim-web-devicons",
            "folke/tokyonight.nvim"
	    },
        opts = { theme = "everforest" }
    },

    -- git signs
    {
        "lewis6991/gitsigns.nvim",
        opts = {}
    },

	{
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}
	},

    { "LionC/nest.nvim" },

    {
        "psf/black",
        branch = "main"
    },

    { "fisadev/vim-isort" },

    -- { "sainnhe/everforest" },
    
    { "rafamadriz/neon" },

    {
        "ms-jpq/chadtree",
        branch = "chad",
        build = "python3 -m chadtree deps"
    },
 }
