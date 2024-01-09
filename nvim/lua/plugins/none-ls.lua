return {
    "nvimtools/none-ls.nvim",
    lazy = true,
    event = "LspAttach",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    opts = function()
        return require("configs.none-ls")
    end
}
