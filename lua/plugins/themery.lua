return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		local theme_names = {
			"bamboo",
			"tokyonight",
			"dracula",
			"rose-pine",
			"farout",
			"melange",
			"zenbones",
			"zenwritten",
			"neobones",
			"vimbones",
			"rosebones",
			"forestbones",
			"nordbones",
			"tokyobones",
			"seoulbones",
			"duckbones",
			"zenburned",
			"kanagawabones",
			"miasma",
			"everforest",
			"gruvbones"
		}

		local themery_themes = {}
		for _, theme in ipairs(theme_names) do
			table.insert(themery_themes, {
				name = theme,
				colorscheme = theme,
				before = [[vim.opt.background = "dark"]],
			})
		end

		require("themery").setup({
			-- add the config here
			themes = themery_themes,
			livePreview = true,
		})

		vim.keymap.set("n", "<Leader>tt", "<CMD>Themery <CR>", {})
	end,
}
