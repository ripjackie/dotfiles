require("lazy").setup {
	{ "neoclide/coc.nvim", branch = "release" },

	-- nvim-treesitter
	{ "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                highlight = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm"
                    },
                },
                indent = {
                    enable = true
                }
            }
        end
	},

    { "nvim-lualine/lualine.nvim",
	    event = "VeryLazy",
	    requires = {
		    "nvim-tree/nvim-web-devicons"
	    },
        opts = {  theme = "auto" }
    },

    { "lukas-reineke/indent-blankline.nvim",
        opts = {
            space_char_blankline = " ",
            show_current_context = true,
            show_current_context_start = true,
            use_treesitter = true,
            show_trailing_blankline_indent = false
        }
    },

    -- barbecue
    { "utilyre/barbecue.nvim",
	    event = "VeryLazy",
	    dependencies = {
		    "SmiteshP/nvim-navic",
		    "nvim-tree/nvim-web-devicons",
	    },
        opts = { theme = "auto" }
    },

    -- git signs
    { "lewis6991/gitsigns.nvim", opts = {} },

	{ "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}
	},

    { "LionC/nest.nvim" },

    { "sainnhe/edge",
        init = function()
            vim.g.edge_style = "aura"
            vim.g.edge_better_performance = 1
            vim.cmd.colorscheme("edge")
        end
    },

    { "stevearc/oil.nvim",
        depenencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {}
    }

 }
