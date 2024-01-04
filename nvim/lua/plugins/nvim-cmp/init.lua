return {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = "InsertEnter",
    dependencies = {
        -- general
        "neovim/nvim-lspconfig",
        "onsails/lspkind.nvim",
        -- buffer sources
        "hrsh7th/cmp-cmdline",
        "FelipeLema/cmp-async-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        -- snippets
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets"
    },
    opts = function()
        return require("plugins.nvim-cmp.configs")
    end
}
