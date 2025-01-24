return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.cmd(":Neotree focus filesystem reveal_force_cwd right")
		vim.keymap.set("n", "<C-n>", ":Neotree focus filesystem reveal_force_cwd right<CR>", {})
	end,
}
