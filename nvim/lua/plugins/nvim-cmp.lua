return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-nvim-lua",
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
                    "/home/ripjack/.config/nvim/lua/plugins/"
                }
            }
        },
    }
}
