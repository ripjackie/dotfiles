return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-fzf-native.nvim",
    },
}
