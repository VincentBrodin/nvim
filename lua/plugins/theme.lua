return {
	{
		"slugbyte/lackluster.nvim",
		priority = 1000,
	},
	{
		"EdenEast/nightfox.nvim",
		config = function()
			require('nightfox').setup({
				options = {
					styles = {
						comments = "italic",
						keywords = "bold",
						types = "italic,bold",
					}
				}
			})
		end
	},
	{
		"rakr/vim-one"
	},
	{
		"thesimonho/kanagawa-paper.nvim",
		priority = 1000,
		opts = {},
		config = function()
			require("kanagawa-paper").setup({
				undercurl = true,
				transparent = false,
				gutter = false,
				diag_background = true,
				dim_inactive = false,
				terminal_colors = true,
				cache = false,

				styles = {
					comment = { italic = true },
					functions = { italic = false },
					keyword = { italic = false, bold = true },
					-- style for statements
					statement = { italic = false, bold = false },
					-- style for types
					type = { italic = true },
				},
				-- override default palette and theme colors
				colors = {
					palette = {},
					theme = {
						ink = {},
						canvas = {},
					},
				},
				-- adjust overall color balance for each theme [-1, 1]
				color_offset = {
					ink = { brightness = 0, saturation = 0 },
					canvas = { brightness = 0, saturation = 0 },
				},
				-- override highlight groups
				overrides = function(colors)
					return {}
				end,

				-- uses lazy.nvim, if installed, to automatically enable needed plugins
				auto_plugins = true,
				-- enable highlights for all plugins (disabled if using lazy.nvim)
				all_plugins = package.loaded.lazy == nil,
				-- manually enable/disable individual plugins.
				-- check the `groups/plugins` directory for the exact names
				plugins = {
					-- examples:
					-- rainbow_delimiters = true
					-- which_key = false
				},

				-- enable integrations with other applications
				integrations = {
					-- automatically set wezterm theme to match the current neovim theme
					wezterm = {
						enabled = false,
						-- neovim will write the theme name to this file
						-- wezterm will read from this file to know which theme to use
						path = (os.getenv("TEMP") or "/tmp") .. "/nvim-theme",
					},
				},
			})
		end
	},
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			require('onedark').setup {
				style = 'darker'
			}
		end
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
	},
	{
		"sam4llis/nvim-tundra",
		priority = 1000,
		config = function()
			require('nvim-tundra').setup({
				transparent_background = false,
				dim_inactive_windows = {
					enabled = false,
					color = nil,
				},
				sidebars = {
					enabled = true,
					color = nil,
				},
				editor = {
					search = {},
					substitute = {},
				},
				syntax = {
					booleans = { bold = true, italic = true },
					comments = { bold = true, italic = true },
					conditionals = {},
					constants = { bold = true },
					fields = {},
					functions = {},
					keywords = {},
					loops = {},
					numbers = { bold = true },
					operators = { bold = true },
					punctuation = {},
					strings = {},
					types = { italic = true },
				},
				diagnostics = {
					errors = {},
					warnings = {},
					information = {},
					hints = {},
				},
				plugins = {
					lsp = true,
					semantic_tokens = true,
					treesitter = true,
					telescope = true,
					nvimtree = true,
					cmp = true,
					context = true,
					dbui = true,
					gitsigns = true,
					neogit = true,
					textfsm = true,
				},
				overwrite = {
					colors = {},
					highlights = {},
				},
			})

			vim.g.tundra_biome = 'arctic' -- 'arctic' or 'jungle'
			vim.opt.background = 'dark'
		end
	},

	{
		"dgox16/oldworld.nvim",
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
			})
		end
	},
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
	{
		"sainnhe/everforest",
		priority = 1000,
	},
	{
		"xero/miasma.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"ribru17/bamboo.nvim",
		priority = 1000,
		config = function()
			require("bamboo").setup({
				-- Main options --
				-- NOTE: to use the light theme, set `vim.o.background = 'light'`
				style = "vulgaris",                           -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
				toggle_style_key = "<leader>ts",              -- Keybind to toggle theme style. Leave it nil to disable it, or set it to a string, e.g. "<leader>ts"
				toggle_style_list = { "vulgaris", "multiplex", "light" }, -- List of styles to toggle between
				transparent = false,                          -- Show/hide background
				dim_inactive = false,                         -- Dim inactive windows/buffers
				term_colors = true,                           -- Change terminal color as per the selected theme style
				ending_tildes = false,                        -- Show the end-of-buffer tildes. By default they are hidden
				cmp_itemkind_reverse = false,                 -- reverse item kind highlights in cmp menu

				-- Change code style ---
				-- Options are anything that can be passed to the `vim.api.nvim_set_hl` table
				-- You can also configure styles with a string, e.g. keywords = 'italic,bold'
				code_style = {
					comments = { italic = true },
					conditionals = { italic = true },
					keywords = {},
					functions = {},
					namespaces = { italic = true },
					parameters = { italic = true },
					strings = {},
					variables = {},
				},

				-- Lualine options --
				lualine = {
					transparent = false, -- lualine center bar transparency
				},

				-- Custom Highlights --
				colors = {}, -- Override default colors
				highlights = {}, -- Override highlight groups

				-- Plugins Config --
				diagnostics = {
					darker = false, -- darker colors for diagnostic
					undercurl = true, -- use undercurl instead of underline for diagnostics
					background = true, -- use background color for virtual text
				},
			})
			-- require("bamboo").load()
		end,
	},
	{
		"thallada/farout.nvim",
		priority = 1000,
	},
	{
		"savq/melange-nvim",
		priority = 1000,
	},
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		priority = 1000,
		config = function()
			vim.g.zenbones_colorize_diagnostic_underline_text = true
			vim.g.zenbones_lighten_noncurrent_window = true
		end
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		priority = 1000,
	},

	{
		"Mofiqul/dracula.nvim",
		name = "dracula",
		priority = 1000,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
	},
}
