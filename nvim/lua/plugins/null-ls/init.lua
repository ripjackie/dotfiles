return {
    "nvimtools/none-ls.nvim",
    lazy = true,
    event = "LspAttach",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    opts = function()
        return require("plugins.null-ls.configs")
    end
}
