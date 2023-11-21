return {
    "lewis6991/gitsigns.nvim",
    opts = {
        numhl = true,
        on_attach = function(bufnr)
            require("caskey").emit("Gitsigns", bufnr)
        end
    }
}
