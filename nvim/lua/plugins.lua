require("lazy").setup {
    -- nvim-lsp
    { "neovim/nvim-lspconfig" },

    -- coq-nvim
    {
        "ms-jpq/coq_nvim",
        branch = "coq"
    },

    {
        "ms-jpq/coq.artifacts",
        branch = "artifacts"
    },

    {
        "ms-jpq/coq.thirdparty",
        branch = "3p"
    },

    -- nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                highlight = { enable = true },
                indent = { enable = true },
                incremental_selection  = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm"
                    },
                }
            })
        end,
    },

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
