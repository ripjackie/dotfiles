local vim = vim
local nest = require("nest")
local gitsigns = require("gitsigns")

nest.applyKeymaps({
    {
        mode = "i",
        {
            { "jk", "<Esc>" }
        }
    },
    { "<leader>", {
        { "l", {
            { "r", "<cmd>Lspsaga rename<cr>" },
            { "f", "<cmd>Lspsaga finder<cr>" },
            { "t", "<cmd>Lspsaga term_toggle<cr>" },
        } },
        { "g", {
            {
                mode = "v",
                {
                    { "s", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end },
                    { "r", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end }
                }
            },
            { "s", gitsigns.stage_hunk },
            { "r", gitsigns.reset_hunk },
            { "S", gitsigns.stage_buffer },
            { "R", gitsigns.reset_buffer },
            { "u", gitsigns.undo_stage_hunk },
            { "p", gitsigns.preview_hunk_inline },
            { "b", gitsigns.toggle_current_line_blame },
            { "d", gitsigns.diffthis },
            { "D", function() gitsigns.diffthis("~") end }
        } },
        { "h", "<cmd>HopWord<cr>" },
        { "s", vim.diagnostic.open_float },
        { "t", vim.lsp.buf.hover }
    } }
})
