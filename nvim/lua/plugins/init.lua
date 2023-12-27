local plugins = {}

local insert = function(plugin)
    table.insert(plugins, plugin)
end

-- Keymaps
insert({
    "Nexmean/caskey.nvim",
    dependencies = { "folke/which-key.nvim" }
})

-- Colorscheme
insert({
    "navarasu/onedark.nvim",
    config = function()
        local onedark = require("onedark")
        onedark.setup({
            style = "deep"
        })
        onedark.load()
    end
})

-- LSP
insert({
    "neovim/nvim-lspconfig"
})

insert({
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = {
        ensure_installed = {
            "lua-language-server",
            "pyright",
            "ruff"
        }
    }
})

insert({
    "folke/neodev.nvim"
})

insert({
    "junnplus/lsp-setup.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "folke/neodev.nvim",
        "williamboman/mason.nvim"
    },
    opts = require("plugins.configs.lsp-setup")
})

insert({
    "jinzhongjia/LspUI.nvim",
    opts = {}
})

-- CMP
insert({
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "RRethy/nvim-treesitter-endwise" },
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
        hightlight = { enable = true },
        indent = { enable = true },
        endwise = { enable = true },
        ensure_installed = {
            "lua", "python", "vim", "vimdoc", "query", "markdown", "markdown_inline"
        }
    }
})

insert({
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        --general
        "neovim/nvim-lspconfig",
        "onsails/lspkind.nvim",
        -- sources
        "hrsh7th/cmp-cmdline",
        "FelipeLema/cmp-async-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        -- snippets
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local cmp = require("cmp")
        local opts = require("plugins.configs.cmp")
        cmp.setup(opts)
    end
})

-- General
insert({
    "utilyre/barbecue.nvim",
    event = "LspAttach",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons"
    },
    opts = {}
})

insert({
    "lewis6991/gitsigns.nvim",
    opts = {}
})

insert({
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {}
})

insert({
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-fzf-native.nvim"
    }
})

insert({
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6",
    opts = {
        space2 = { enable = true }
    }
})

return plugins
