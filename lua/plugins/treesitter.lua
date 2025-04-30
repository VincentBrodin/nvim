return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			local install = require("nvim-treesitter.install")
			local treesitter = vim.treesitter
			install.prefer_git = false
			install.compilers = { "zig", "clang", "gcc" }

			configs.setup({
				ensure_installed = { "lua" },
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})

			treesitter.language.register("html", "hbs")
		end,
},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			local context = require("treesitter-context")
			context.setup({
				enable = true,
				multiwindow = false, -- Enable multiwindow support.
				max_lines = 0,
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 20, -- Maximum number of lines to show for a single context
				trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = "cursor",
				separator = nil,
				zindex = 20,
				on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			})
		end,
	},
}
