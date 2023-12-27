local ck = require("caskey")
local telescope = require("telescope.builtin")

local keymaps = {
    mode = "n",

    ["<leader>x"] = { act = vim.cmd.Ex, desc = "Explorer" },
    ["<leader>f"] = {
        f = { act = telescope.find_files, desc = "Telescope Find Files" },
        g = { act = telescope.live_grep, desc = "Telescope Live Grep" },
        b = { act = telescope.buffers, desc = "Telescope Buffers" },
        h = { act = telescope.help_tags, desc = "Telescope Help Tags" }
    }
}

require("caskey.wk").setup(keymaps)
