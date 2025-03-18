return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- { "3rd/image.nvim", opts = {} },
	},
	config = function()
		local neotree = require("neo-tree")
		neotree.setup({
			default_component_configs = {
				git_status = {
					symbols = {
						-- Change type
						added = "✚",
						deleted = "✖",
						modified = "",
						renamed = "󰁕",
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "",
						staged = "󰸞",
						conflict = "",
					},
				},
			},
		})
		vim.cmd(":Neotree focus filesystem reveal_force_cwd right")
		vim.keymap.set("n", "<C-n>", ":Neotree focus filesystem reveal_force_cwd right<CR>", {})
	end,
}
