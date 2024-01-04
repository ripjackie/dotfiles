local vim = vim

local show_lsp = function()
    local msg = ""
    local clients = vim.lsp.get_clients()
    local actives = {}

    if next(clients) == nil then
        msg = "No LSP"
    else
        for _, client in pairs(clients) do
            table.insert(actives, client.name)
        end
        table.sort(actives)
        for _, client in pairs(actives) do
            if msg == "" then
                msg = msg .. client
            else
                msg = msg .. " | " .. client
            end
        end
    end
    return msg
end

local M = {}
M.options = {
    theme = "auto",
    component_separators = "|",
    section_separators = { left = "", right = "" },
}

M.sections = {
    lualine_a = {
        { "mode", separator = { left = "" }, right_padding = 2 },
    },
    lualine_b = { "filename", "branch" },
    lualine_c = { "fileformat" },
    lualine_x = { "diagnostics", show_lsp },
    lualine_y = { "filetype", "progress" },
    lualine_z = {
        { "location", separator = { right = "" }, left_padding = 2 },
    },
}
M.inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location" },
}
M.tabline = {}
M.extensions = {}

return M
