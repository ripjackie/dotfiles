return {
    "junnplus/lsp-setup.nvim",
    config = function ()
        local neodev_opts = require("configs.neodev")
        local lsp_setup_opts = require("configs.lsp-setup")

        require("neodev").setup(neodev_opts)
        require("lsp-setup").setup(lsp_setup_opts)
    end
}
