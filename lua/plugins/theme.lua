return {
	{
		"zenbones-theme/zenbones.nvim",
		name = "zenbones",
		dependencies = "rktjmp/lush.nvim",
		config = function()
			vim.cmd("colorscheme zenbones")
		end,
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
		name = "oxocarbon",
		config = function()
			-- vim.cmd("colorscheme oxocarbon")
		end,
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		config = function()
			-- vim.cmd("colorscheme tokyonight")
		end,
	},

	{
		"Mofiqul/dracula.nvim",
		name = "dracula",
		config = function()
			-- vim.cmd("colorscheme dracula")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			--vim.cmd("colorscheme rose-pine")
		end,
	},
}
