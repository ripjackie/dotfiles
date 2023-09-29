local builtin = require("telescope.builtin")
local neogit  = require("neogit")

require("nest").applyKeymaps {
    { "<leader>", {
        { "f", { -- telescope
            { "f", builtin.find_files },
            { "g", builtin.live_grep },
            { "b", builtin.buffers },
            { "h", builtin.help_tags },
        } },
        { "l", { -- lspsaga
            { "r", "<cmd>Lspsaga rename<cr>" },
            { "f", "<cmd>Lspsaga finder<cr>" },
            { "t", "<cmd>Lspsaga term_toggle<cr>" },
        } },
        { "h", "<cmd>HopWord<cr>" },        -- hop
        { "s", vim.diagnostic.open_float }, -- diagnostics
        { "t", vim.lsp.buf.hover },
        { "n", function() neogit.open({kind="auto"}) end }
    } }
}
