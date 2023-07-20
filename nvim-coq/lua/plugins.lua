require("lazy").setup {
    -- nvim-lsp
    { "neovim/nvim-lspconfig",
        requires = {"ms-jpq/coq_nvim"},
        config = function()
            local lsp = require("lspconfig")
            local coq = require("coq")
            lsp.pyright.setup(coq.lsp_ensure_capabilities {})
            lsp.lua_ls.setup(
                coq.lsp_ensure_capabilities {
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            diagnostics = { globals = { "vim" } },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                            },
                            telemetry = { enable = false },
                        },
                    },
                }
            )
        end
    },
    -- coq-nvim
    { "ms-jpq/coq_nvim", branch = "coq" },

    { "ms-jpq/coq.artifacts", branch = "artifacts" },

    { "ms-jpq/coq.thirdparty", branch = "3p" },
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
	    dependencies = {
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

    {
        "sainnhe/edge",
        init = function()
            vim.g.edge_style = "aura"
            vim.g.edge_better_performance = 1
            vim.cmd.colorscheme("edge")
        end
    },

    { "stevearc/oil.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {}
    },

    { "wfxr/minimap.vim",
        lazy = false,
        init = function()
            vim.g.minimap_auto_start = 1
            vim.g.minimap_width = 10
            vim.g.minimap_highlight_range = true
            vim.g.minimap_highlight_search = true
        end
    },
 }
