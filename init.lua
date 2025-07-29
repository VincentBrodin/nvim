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
	{ src = "https://github.com/echasnovski/mini.files" },       -- FS
	{ src = "https://github.com/echasnovski/mini.pairs" },       -- Simple autoclose
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

-- mini.files
local mf = require "mini.files";
mf.setup {
	options = {
		permanent_delete = false,
	}
}
local mf_toggle = function(...)
	if not mf.close() then
		local bufname = vim.api.nvim_buf_get_name(0)
		local path = bufname ~= "" and bufname or vim.fn.getcwd()
		mf.open(path) -- makes sure that we open to the current file
	end
end

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesExplorerOpen",
  callback = function()
    mf.reveal_cwd()
  end,
})

vim.keymap.set("n", "-", mf_toggle);

-- mini.pairs
require "mini.pairs".setup()


-- mini.pick
require "mini.pick".setup()
vim.keymap.set("n", "<leader>f", "<CMD>Pick files<CR>")
vim.keymap.set("n", "<leader>g", "<CMD>Pick grep<CR>")

-- mini.completion
require "mini.completion".setup {
	auto_setup = true,
}

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
