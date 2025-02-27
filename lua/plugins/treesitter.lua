return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		local install = require("nvim-treesitter.install")
		local treesitter = vim.treesitter
		install.prefer_git = false
		install.compilers = { "zig", "clang" }

		configs.setup({
			ensure_installed = { "lua" },
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})

		treesitter.language.register("html", "hbs")
	end,
}
