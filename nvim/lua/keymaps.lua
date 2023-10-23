local vim = vim
local nest = require("nest")

nest.applyKeymaps({
    { "<leader>", {
        { "l", {
            { "r", "<cmd>Lspsaga rename<cr>" },
            { "f", "<cmd>Lspsaga finder<cr>" },
            { "t", "<cmd>Lspsaga term_toggle<cr>" },
        } },
        { "h", "<cmd>HopWord<cr>" },
        { "s", vim.diagnostic.open_float },
        { "t", vim.lsp.buf.hover }
    } }
})
