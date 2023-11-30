local vim = vim
local ck = require("caskey")
local hop = require("hop")

return {
    mode = "n",
    ["jk"] = { act = "<Esc>", desc = "Exit Insert Mode", mode = "i" },

    ["<leader>"] = {
        l = {
            name = "Lspsaga",
            when = "LspAttach",

            r = { act = ck.cmd "Lspsaga rename", desc = "Rename" },
            f = { act = ck.cmd "Lspsaga finder", desc = "Finder" },
            t = { act = ck.cmd "Lspsaga term_toggle", desc = "Term Toggle" },
            h = { act = ck.cmd "Lspsaga hover_doc", desc = "Hover Doc" },
            o = { act = ck.cmd "Lspsaga outline", desc = "Outline" },
            c = { act = ck.cmd "Lspsaga code_action", desc = "Code Action" },
            n = { act = ck.cmd "Lspsaga diagnostic_jump_next", desc = "Diagnostic Jump Next" },
            p = { act = ck.cmd "Lspsaga diagnostic_jump_prev", desc = "Diagnostic Jump Prev" },
            d = {
                name = "Definitions",
                d = { act = ck.cmd "Lspsaga peek_definition", desc = "Peek Definition" },
                t = { act = ck.cmd "Lspsaga peek_type_definition", desc = "Peek Type Definition" }
            }
        },
        g = function()
            local gs = require("gitsigns")
            return {
                name = "Gitsigns",
                when = ck.emitted "Gitsigns",

                {
                    mode = "v",
                    s = {
                        act = function()
                            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                        end,
                        desc = "Stage Line Visual"
                    },
                    r = {
                        act = function()
                            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                        end,
                        desc = "Reset Line Visual"
                    }
                },

                s = { act = gs.stage_hunk, desc = "Stage Hunk" },
                r = { act = gs.reset_hunk, desc = "Reset Hunk" },
                S = { act = gs.stage_buffer, desc = "Stage Buffer" },
                R = { act = gs.reset_buffer, desc = "Reset Buffer" },
                u = { act = gs.undo_stage_hunk, desc = "Undo Stage Hunk" },
                p = { act = gs.preview_hunk_inline, desc = "Preview Hunk Inline" },
                b = { act = gs.toggle_current_line_blame, desc = "Toggle Current Line Blame" },
                d = { act = gs.diffthis, desc = "Diff This" },
                D = { act = function() gs.diffthis("~") end, desc = "Diff This Different?" }
            }
        end,
        f = function()
            local ts = require("telescope")
            return {
                name = "Telescope",
                when = "LspAttach",

                f = { act = ts.find_files, desc = "Telescope Find Files" },
                g = { act = ts.live_grep, desc = "Telescope Live Grep (ripgrep)" },
                b = { act = ts.buffers, desc = "Telescope Buffers" },
                h = { act = ts.help_tags, desc = "Telescope Help Tags" }
            }
        end,
        v = { act = ck.cmd "Neotree toggle", desc = "Open Neo-Tree" },
        b = {
            name = "Buffers",
            n = { act = ck.cmd "bnext", desc = "Buffer Next" },
            p = { act = ck.cmd "bprevious", desc = "Buffer Previous" },
            d = { act = ck.cmd "Bdelete", desc = "Buffer Delete" }
        },
        h = { act = hop.hint_words, desc = "Hop Word" },
        x = { act = ck.cmd "Explore", desc = "Open Netrw Explorer" }
    }
}
