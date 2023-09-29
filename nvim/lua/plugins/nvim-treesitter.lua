return {
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
            }
        },
        ensure_installed = {
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "http",
            "json",
            "xml",
            "python",
            "markdown",
            "markdown_inline"
        }
    }
}
