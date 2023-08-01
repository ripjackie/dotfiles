require("lazy").setup {
    -- nvim-lsp
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "hrsh7th/nvim-cmp",
                dependencies = {
                    "hrsh7th/cmp-cmdline",
                    "hrsh7th/cmp-path",
                    "hrsh7th/cmp-buffer",
                    "hrsh7th/cmp-calc",
                    -- lspconfig
                    "hrsh7th/cmp-nvim-lsp",
                    -- luasnip
                    "L3MON4D3/LuaSnip",
                    "saadparwaiz1/cmp_luasnip",
                    -- cmp plugins
                    {
                        "KadoBOT/cmp-plugins",
                        opts = {
                            files = {
                                "plugins.lua"
                            }
                        }
                    }
                }
            },
        }
    },

    -- nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm"
                },
            }
        },
    },

    { "nvim-tree/nvim-web-devicons" },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {}
    },

    {
        "nvimdev/lspsaga.nvim",
        opts = {},
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        event = "LspAttach",
    },

    {
        "folke/neodev.nvim",
        opts = {}
    },

    {
        "junnplus/lsp-setup.nvim",
        dependencies = {
            "neovim/nvim-lspconfig"
        }
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            space_char_blankline = " ",
            show_current_context = true,
            show_current_context_start = true
        }
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
        "phaazon/hop.nvim",
        opts = {}
    },

    {
        "sainnhe/edge",
        init = function()
            vim.g.edge_style = "aura"
            vim.g.edge_better_performance = 1
            vim.cmd.colorscheme("edge")
        end
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep",
            "nvim-tree/nvim-web-devicons",
        },
        tag = "0.1.2",
    }
}
