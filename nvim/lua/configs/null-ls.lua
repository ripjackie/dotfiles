local null_ls = require("null-ls")
local opts = {}

local fmt = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local cmp = null_ls.builtins.completion

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

opts.on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					async = false,
					bufnr = bufnr,
					filter = function(client)
						return client.name == "null-ls"
					end,
				})
			end,
		})
	end
end

opts.sources = {
	lint.selene,
	fmt.stylua,
}

return opts
