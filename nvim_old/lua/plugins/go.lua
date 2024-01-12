return {
    "ray-x/go.nvim",
    lazy = true,
    build = ":lua require('go.install').update_all_sync()",
    dependencies = {
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter"
    },
    opts = {},
    ft = { "go", "gomod" },
}
