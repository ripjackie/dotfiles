return {
    "akinsho/bufferline.nvim",
    lazy = true,
    event = "VeryLazy",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        options = {
            offsets = {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                seperator = true,
            },
        },
    },
}
