return {
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		opts = require "configs.conform",
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require "configs.lspconfig"
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"html",
				"css",
			},
		},
	},
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"ThePrimeagen/harpoon",
		config = function()
			require "harpoon"
		end,
		keys = {
			{
				"<leader>aa",
				function()
					local ui = require "harpoon.ui"
					ui.toggle_quick_menu()
				end,
			},
			{
				"<leader>af",
				function()
					local mark = require "harpoon.mark"
					mark.toggle_quick_add_file()
				end,
			},
			{
				"<leader>a1",
				function()
					local ui = require "harpoon.ui"
					ui.nav_file(1)
				end,
			},
			{
				"<leader>a2",
				function()
					local ui = require "harpoon.ui"
					ui.nav_file(2)
				end,
			},
			{
				"<leader>a3",
				function()
					local ui = require "harpoon.ui"
					ui.nav_file(3)
				end,
			},
		},
	},
	{
		"toppair/peek.nvim",
		build = "deno task --quiet build:fast",
		keys = {
			{
				"<leader>op",
				function()
					local peek = require "peek"
					if peek.is_open() then
						peek.close()
					else
						peek.open()
					end
				end,
				desc = "Peek (Markdown Preview)",
			},
		},
		opts = { theme = "dark", app = "browser" },
	},
}
