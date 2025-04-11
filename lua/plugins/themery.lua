return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			-- add the config here
			themes = {"bamboo", "tokyonight", "dracula", "rose-pine", "zenbones", "farout", "melange"},
			livePreview = true,
		})

		vim.keymap.set("n", "<Leader>tt", "<CMD>Themery <CR>", {})
	end,
}
