vim.o.number = true
vim.o.relativenumber = true

vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.o.wrap = false
vim.o.swapfile = false

vim.o.signcolumn = "yes"

vim.o.clipboard = "unnamedplus"

vim.g.mapleader = " "

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false
})

vim.pack.add({
	{ src = "https://github.com/thesimonho/kanagawa-paper.nvim" }, -- Colorscheme
	{ src = "https://github.com/jinh0/eyeliner.nvim" },          -- Quick string jumping
	{ src = "https://github.com/stevearc/oil.nvim" },            -- FS
	{ src = "https://github.com/m4xshen/autoclose.nvim" },       -- Simple autoclose
	{ src = "https://github.com/echasnovski/mini.pick" },        -- Grep and file search
	{ src = "https://github.com/echasnovski/mini.completion" },  -- LPS completion
	{ src = "https://github.com/neovim/nvim-lspconfig" },        -- LPS defualt configs
	{ src = "https://github.com/mason-org/mason.nvim" },         -- LPS install manager
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }, -- Syntax highlighting
})

-- colorscheme
vim.cmd("set termguicolors")
vim.cmd("set bg=dark")
vim.cmd("colorscheme kanagawa-paper")

-- eyeliner
require "eyeliner".setup {
	highlight_on_key = true,
	dim = true,
	max_length = 9999,
}

-- oil
require "oil".setup {
	delete_to_trash = true,
	watch_for_changes = true,
	win_options = {
		signcolumn = "yes",
	},
	view_options = {
		show_hidden = true,
	}
}
vim.keymap.set("n", "-", "<CMD>Oil<CR>")


-- autoclose
require "autoclose".setup()


-- mini.pick
require "mini.pick".setup()
vim.keymap.set("n", "<leader>f", "<CMD>Pick files<CR>")
vim.keymap.set("n", "<leader>g", "<CMD>Pick grep<CR>")

-- mini.completion
require "mini.completion".setup {
	auto_setup = true,
}
vim.keymap.set('i', '<Tab>', function()
	return vim.fn.pumvisible() == 1 and '<C-n>'
end, { expr = true, noremap = true })

-- mason
require "mason".setup()

-- lsp
vim.lsp.enable({ "lua_ls", "clangd" })
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf }
		local buf = vim.lsp.buf

		vim.keymap.set("n", "K", buf.hover, opts)
		vim.keymap.set("n", "gD", buf.declaration, opts)
		vim.keymap.set("n", "gd", buf.definition, opts)
		vim.keymap.set({ "n", "v" }, "<C-r><C-r>", buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", buf.code_action, opts)
		vim.keymap.set({ "n", "v" }, "<leader>lf", function()
			buf.format({ async = true })
		end, opts)
	end,
})

-- treesitter
require "nvim-treesitter.configs".setup {
	auto_install = true,
}
