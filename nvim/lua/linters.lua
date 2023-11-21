local lint = require("lint")
local vim = vim

lint.linters_by_ft = {
    lua = { 'luacheck', },
    python = { 'mypy', }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        lint.try_lint()
    end
})
