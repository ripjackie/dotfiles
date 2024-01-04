local themes = {}

local make_output = function(inp)
	local theme_list = {}
	local output = {}

	for i, _ in pairs(inp) do
		table.insert(theme_list, i)
	end
	table.sort(theme_list)
	for _, theme in pairs(theme_list) do
		for _, colorscheme in pairs(inp[theme]) do
			table.insert(output, colorscheme)
		end
	end
	return output
end

themes.catppuccin = {
	{
		name = "Catppuccin Latte",
		colorscheme = "catppuccin-latte",
		before = [[
        vim.opt.background = "light"
        ]],
	},
	{
		name = "Catppuccin Frappe",
		colorscheme = "catppuccin-frappe",
		before = [[
        vim.opt.background = "dark"
        ]],
	},
	{
		name = "Catppuccin Macchiato",
		colorscheme = "catppuccin-macchiato",
		before = [[
        vim.opt.background = "dark"
        ]],
	},
	{
		name = "Catppuccin Mocha",
		colorscheme = "catppuccin-mocha",
		before = [[
        vim.opt.background = "dark"
        ]],
	},
}

themes.edge = {
	{
		name = "Edge",
		colorscheme = "edge",
		before = [[
        vim.g.edge_style = "default"
        vim.opt.background = "dark"
        ]],
	},
	{
		name = "Edge Aura",
		colorscheme = "edge",
		before = [[
        vim.g.edge_style = "aura"
        vim.opt.background = "dark"
        ]],
	},
	{
		name = "Edge Neon",
		colorscheme = "edge",
		before = [[
        vim.g.edge_style = "neon"
        vim.opt.background = "dark"
        ]],
	},
	{
		name = "Edge Light",
		colorscheme = "edge",
		before = [[
        vim.g.edge_style = "light"
        vim.opt.background = "light"
        ]],
	},
}

themes.everforest = {
	{
		name = "Everforest Dark Hard",
		colorscheme = "everforest",
		before = [[
        vim.opt.background = "dark"
        vim.g.everforest_background = "hard"
        ]],
	},
	{
		name = "Everforest Dark Medium",
		colorscheme = "everforest",
		before = [[
        vim.opt.background = "dark"
        vim.g.everforest_background = "medium"
        ]],
	},
	{
		name = "Everforest Dark Soft",
		colorscheme = "everforest",
		before = [[
        vim.opt.background = "dark"
        vim.g.everforest_background = "soft"
        ]],
	},
	{
		name = "Everforest Light Hard",
		colorscheme = "everforest",
		before = [[
        vim.opt.background = "light"
        vim.g.everforest_background = "hard"
        ]],
	},
	{
		name = "Everforest Light Medium",
		colorscheme = "everforest",
		before = [[
        vim.opt.background = "light"
        vim.g.everforest_background = "medium"
        ]],
	},
	{
		name = "Everforest Light Soft",
		colorscheme = "everforest",
		before = [[
        vim.opt.background = "light"
        vim.g.everforest_background = "soft"
        ]],
	},
}

themes.sonokai = {
	{
		name = "Sonokai",
		colorscheme = "sonokai",
		before = [[
        vim.g.sonokai_style = "default"
        vim.opt.background = "dark"
        ]],
	},
	{
		name = "Sonokai Atlantis",
		colorscheme = "sonokai",
		before = [[
        vim.g.sonokai_style = "atlantis"
        vim.opt.background = "dark"
        ]],
	},
	{
		name = "Sonokai Andromeda",
		colorscheme = "sonokai",
		before = [[
        vim.g.sonokai_style = "andromeda"
        vim.opt.background = "dark"
        ]],
	},
	{
		name = "Sonokai Shusia",
		colorscheme = "sonokai",
		before = [[
        vim.g.sonokai_style = "shusia"
        vim.opt.background = "dark"
        ]],
	},
	{
		name = "Sonokai Maia",
		colorscheme = "sonokai",
		before = [[
        vim.g.sonokai_style = "maia"
        vim.opt.background = "dark"
        ]],
	},
	{
		name = "Sonokai Espresso",
		colorscheme = "sonokai",
		before = [[
        vim.g.sonokai_style = "espresso"
        vim.opt.background = "dark"
        ]],
	},
}

themes.bamboo = {
	{
		name = "Bamboo Dark",
		colorscheme = "bamboo",
		before = [[
        vim.opt.background = "dark"
        ]],
	},
	{
		name = "Bamboo Light",
		colorscheme = "bamboo",
		before = [[
        vim.opt.background = "light"
        ]],
	},
}

return make_output(themes)
