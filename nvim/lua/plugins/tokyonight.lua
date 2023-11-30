return {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {
        style = "night",
        styles = {
            comments = { italic = true },
            keywords = { bold = true, italic = true },
            functions = { bold = true },
            variables = {}
        },
        lualine_bold = true,
        on_highlights = function(hl, c)
            hl.String = {
                fg = hl.String.fg,
                bg = hl.String.bg,
                italic = true
            }
            hl.Constant = {
                fg = hl.Constant.fg,
                bg = hl.Constant.bg,
                italic = true
            }
            hl.PreProc = {
                fg = hl.PreProc.fg,
                bg = hl.PreProc.bg,
                bold = true,
                italic = true
            }
        end
    }
}
