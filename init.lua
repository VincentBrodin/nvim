local lsps = {
	["lua-language-server"] = "lua_ls",
	["clangd"] = "clangd",
	["gopls"] = "gopls",
}

-- UI Settings
vim.o.number = true         -- Show absolute line numbers
vim.o.relativenumber = true -- Show relative line numbers
vim.o.signcolumn = "yes"    -- Always show the sign column
vim.o.wrap = false          -- Disable line wrapping

-- Indentation
vim.o.shiftwidth = 4 -- Indent by 4 spaces
vim.o.tabstop = 4    -- Tab character is 4 spaces

-- File Handling
vim.o.swapfile = false -- Disable swap files

-- Clipboard
vim.o.clipboard = "unnamedplus" -- Use system clipboard

-- Leader Key
vim.g.mapleader = " " -- Set leader key to space

-- Diagnostics
vim.diagnostic.config({
	underline = true,
	virtual_text = true,
	virtual_lines = false,
	signs = true,
	update_in_insert = false,
})

-- plugins
vim.pack.add({
	{ src = "https://github.com/thesimonho/kanagawa-paper.nvim" }, -- Colorscheme
	{ src = "https://github.com/jinh0/eyeliner.nvim" },          -- Quick string jumping
	{ src = "https://github.com/echasnovski/mini.files" },       -- FS
	{ src = "https://github.com/echasnovski/mini.pairs" },       -- Simple autoclose
	{ src = "https://github.com/echasnovski/mini.pick" },        -- Grep and file search
	{ src = "https://github.com/echasnovski/mini.completion" },  -- LPS completion
	{ src = "https://github.com/neovim/nvim-lspconfig" },        -- LPS defualt configs
	{ src = "https://github.com/mason-org/mason.nvim" },         -- LPS install manager
	{ src = "https://github.com/mason-org/mason-registry" },     -- For automatic lsp install
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
	},
	mappings = {
		close       = 'q',
		go_in       = 'L',
		go_in_plus  = 'l',
		go_out      = 'H',
		go_out_plus = 'h',
	},
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
		mf.reset()
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
	lsp_completion = {
		auto_setup = true,
	},
}

vim.keymap.set('i', '<Tab>', function()
	return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
end, { expr = true, noremap = true })

-- mason & registry
require "mason".setup()
local registry = require "mason-registry"

-- makes sure the all the lsps are installed
local function ensure_installed(packages)
	for _, pkg_name in ipairs(packages) do
		local ok, pkg = pcall(registry.get_package, pkg_name)
		if not ok then
			vim.notify("Package not found: " .. pkg_name)
		elseif not pkg:is_installed() then
			pkg:install()
		end
	end
end
ensure_installed(vim.tbl_keys(lsps))

-- lsp
vim.lsp.enable(vim.tbl_values(lsps))
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
