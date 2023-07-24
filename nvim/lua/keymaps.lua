local builtin = require("telescope.builtin")

require("nest").applyKeymaps {
    { "<leader>", {
        { "f", {
            { "f", builtin.find_files },
            { "g", builtin.live_grep },
            { "b", builtin.buffers },
            { "h", builtin.help_tags },
        }}, -- telescope
        { "l", { -- lspsaga
            { "r", "<cmd>Lspsaga rename<cr>" },
            { "f", "<cmd>Lspsaga finder<cr>" },
            { "t", "<cmd>Lspsaga term_toggle<cr>" },
	}},
        { "h", "<cmd>HopWord<cr>" },
        { "c", "<cmd>Oil .<cr>" },
        { "s", vim.diagnostic.open_float },
        { "e", "<cmd>Oil --float ~/.config/nvim<cr>"},
    }}
}
