local wk = require "which-key"
local dapui = require("dapui")
local dap = require("dap")

local cmd = function(cmdstr)
    return "<cmd>" .. cmdstr .. "<cr>"
end


wk.register({
    ["<leader>f"] = {
        name = "+Telescope",
        f = { cmd("Telescope find_files"), "Find Files" },
        g = { cmd("Telescope live_grep"), "Live Grep" }
    },
    ["<leader>fm"] = {
        function()
            vim.lsp.buf.format({ async = false })
        end,
        "Format Buffer"
    },
    ["<leader>l"] = {
        name = "+LspUI",
        a = { cmd("LspUI code_action"), "Code Action" },
        d = {
            name = "+diagnostics",
            n = { cmd("LspUI diagnostic next"), "Jump Next" },
            p = { cmd("LspUI diagnostic prev"), "Jump Prev" },
        },
        r = { cmd("LspUI rename"), "Rename" },
        f = { cmd("LspUI diagnostic next"), "LSP Diagnostic" },
    },
    ["<leader>d"] = {
        name = "+DAP",
        d = { dapui.toggle, "Open Debugger" },
        b = { dap.toggle_breakpoint, "DAP Toggle Breakpoint" },
        c = { dap.continue, "DAP Connect Client" },
        s = {
            name = "+Step",
            o = { require("dap").step_over, "DAP Step Over" },
            i = { require("dap").step_into, "DAP Step Into" },
        }
    },
    ["<leader>u"] = { require("undotree").toggle, "Undotree" },
    ["<leader>th"] = { cmd("Themery"), "Open Themery" },
    ["<leader>tr"] = { cmd("TroubleToggle"), "Open Trouble" },
    ["<leader>q"] = { cmd("Neotree"), "Focus NeoTree" },
    ["<C-n>"] = { cmd("Neotree toggle=true"), "Toggle Nvim Tree" },
    ["<Tab>"] = { cmd("bnext"), "Next Buffer" },
    ["<S-Tab>"] = { cmd("bprev"), "Previous Buffer" },
    ["<leader>x"] = { cmd("bdelete"), "Delete current buffer" },
})
