local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup{
	{"neoclide/coc.nvim",
	 branch = "release"
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
    -- tokyo night theme
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {}
    -- },
    {"sainnhe/everforest"},
    {
	    "nvim-lualine/lualine.nvim",
	    event = "VeryLazy",
	    requires = {
		    "nvim-tree/nvim-web-devicons"
	    },
        config = function ()
            require("lualine").setup{
                options = {theme = "everforest"}
            }
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
    -- barbecue
    {
	    "utilyre/barbecue.nvim",
	    event = "VeryLazy",
	    dependencies = {
		    "SmiteshP/nvim-navic",
		    "nvim-tree/nvim-web-devicons",
            "folke/tokyonight.nvim"
	    },
	    config = function()
            require("barbecue").setup{
                theme = "everforest"
            }
        end
    },
    -- git signs
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup{}
        end
    },
	{
		'windwp/nvim-autopairs',
		config = function()
            require("nvim-autopairs").setup{}
        end
	},
    {"LionC/nest.nvim"}
 }

 require("configurations")
