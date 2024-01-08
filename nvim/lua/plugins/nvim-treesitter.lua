return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
        "RRethy/nvim-treesitter-endwise",
        "windwp/nvim-ts-autotag",
    },
    opts = {
        autotag = { enable = true },
        endwise = { enable = true },
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },
        ensure_installed = {
            "vim", "vimdoc", "markdown", "markdown_inline", "bash",
            "lua", "python", "go"
        },
    },
}
