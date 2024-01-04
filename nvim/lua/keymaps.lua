local wk = require "which-key"

local cmd = function(cmdstr)
    return "<cmd>" .. cmdstr .. "<cr>"
end


wk.register({
    ["<leader>f"] = {
        name = "+Telescope",
        f = { cmd("Telescope find_files"), "Find Files" },
        g = { cmd("Telescope live_grep"), "Live Grep" }
    },
    ["<leader>l"] = {
        name = "+Lspsaga",
        a = { cmd("Lspsaga code_action"), "Code Action" },
        d = {
            name = "+diagnostics",
            n = { cmd("Lspsaga diagnostic_jump_next"), "Jump Next" },
            p = { cmd("Lspsaga diagnostic_jump_prev"), "Jump Prev" },
        },
        r = { cmd("Lspsaga rename"), "Rename" },
    },
    ["<leader>q"] = { cmd("Neotree"), "Focus NeoTree" },
    ["<leader>x"] = { cmd("bdelete"), "Delete current buffer" },
    ["<leader>th"] = { cmd("Themery"), "Open Themery" },
    ["<leader>tr"] = { cmd("TroubleToggle"), "Open Trouble" },
    ["<C-n>"] = { cmd("Neotree toggle=true"), "Toggle Nvim Tree" },
    ["<Tab>"] = { cmd("bnext"), "Next Buffer" },
    ["<S-Tab>"] = { cmd("bprev"), "Previous Buffer" },
})
