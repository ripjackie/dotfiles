local opt = vim.opt
local cmd = vim.cmd

opt.termguicolors = true
opt.tabstop = 4 -- number of columns per tab
opt.softtabstop = 4 -- see multiple spaces as tabstops so <BS> does the right thing
opt.shiftwidth = 4 -- width for autoindents
opt.expandtab = true -- convert tabs to white space
opt.smarttab = true
opt.compatible = false -- disable vi compatibility
opt.showmatch = true -- show matching
opt.ignorecase = true -- case insensitive
opt.hlsearch = true -- highlight search
opt.incsearch = true -- incremental search
opt.number = true -- show line numbers
opt.cc = "80" -- set column border for coding style
opt.syntax = "on" -- enable syntax highlighting
opt.mouse = "a" -- enable mouse 
opt.clipboard = "unnamedplus" -- use system clipboard
opt.cursorline = true -- highlight current cursorline
opt.signcolumn = "yes" -- gutter always enabled
opt.termguicolors = true
opt.list = true
opt.wrap = false -- disable linewrap
opt.background = "dark"
cmd.colorscheme("everforest")

 -- opts reccomended by coc
opt.backup = false
opt.writebackup = false
opt.updatetime = 300


local function coc_select()
    if vim.fn["coc#pum#visible"]() == 1 then
        return vim.fn["coc#pum#confirm"]()
    else
        return "<cr>"
    end
end

local function coc_next()
    if vim.fn["coc#pum#visible"]() == 1 then
        return vim.fn["coc#pum#next"](1)
    else
        return "<tab>"
    end
end

local function coc_prev()
    if vim.fn["coc#pum#visible"]() == 1 then
        return vim.fn["coc#pum#prev"](1)
    else
        return "<s-tab>"
    end
end

local function coc_deselect()
    if vim.fn["coc#pum#visible"]() == 1 then
        return vim.fn["coc#pum#cancel"]()
    else
        return "<bs>"
    end
end

local nest = require("nest")
nest.applyKeymaps {
    { mode = "i",
        { "jk", "<Esc>" },
        { options = { expr = true },
            { "<cr>", coc_select },
            { "<tab>", coc_next },
            { "<s-tab>", coc_prev },
            { "<bs>", coc_deselect },
        }
    }
}

