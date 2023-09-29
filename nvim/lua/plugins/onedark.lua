return {
    "navarasu/onedark.nvim",
    opts = {
        style = "deep",
        code_style = {
            keywords = "italic,bold",
            functions = "bold"
        },
    },
    init = function()
        require("onedark").load()
    end
}
