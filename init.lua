-- UI Settings
vim.o.number = true         -- Show absolute line numbers
vim.o.relativenumber = true -- Show relative line numbers
vim.o.signcolumn = "yes"    -- Always show the sign column
vim.o.wrap = false          -- Disable line wrapping
vim.o.winborder = "rounded"

-- Indentation
vim.o.shiftwidth = 2 -- Indent by 2 spaces
vim.o.tabstop = 2    -- Tab character is 2 spaces

-- File Handling
vim.o.swapfile = false -- Disable swap files
vim.o.undofile = true

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
	{ src = "https://github.com/rebelot/kanagawa.nvim" },          -- Colorscheme
	{ src = "https://github.com/jinh0/eyeliner.nvim" },            -- Quick string jumping
	{ src = "https://github.com/echasnovski/mini.files" },         -- FS
	{ src = "https://github.com/echasnovski/mini.pairs" },         -- Simple autoclose
	{ src = "https://github.com/echasnovski/mini.pick" },          -- Grep and file search
	{ src = "https://github.com/Saghen/blink.cmp" },               -- Completion
	{ src = "https://github.com/mason-org/mason.nvim" },           -- LPS install manager
	{ src = "https://github.com/neovim/nvim-lspconfig" },          -- LPS configs
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }, -- Syntax highlighting
})

-- colorscheme
vim.cmd("set termguicolors")
vim.cmd("set bg=dark")
require "kanagawa".setup {
	commentStyle = { italic = true },
	functionStyle = { bold = true, italic = false},
	keywordStyle = { bold = true, italic = false},
	statementStyle = { bold = true, italic = false },
	typeStyle = { bold = true, italic = false },
	background = {
		dark = "wave",
		light = "lotus"
	},
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none"
				}
			}
		}
	},
}
vim.cmd("colorscheme kanagawa")

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
local mf_toggle = function()
	if not mf.close() then
		mf.open(vim.api.nvim_buf_get_name(0)) -- makes sure that we open to the current file
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
vim.keymap.set("n", "<leader>h", "<CMD>Pick help<CR>")

vim.keymap.set('i', '<Tab>', function()
	return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
end, { expr = true, noremap = true })

-- mason & registry
require "mason".setup()

-- lsp
local lsps = {
	"lua_ls",
	"clangd",
	"gopls",
	"ts_ls"
}
vim.lsp.enable(lsps)
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			}
		}
	}
})
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

-- cmp
require "blink.cmp".setup {
	completion = {
		menu = {
			auto_show = true,
		},
		documentation = { auto_show = true },
		ghost_text = { enabled = true },
	},
	fuzzy = {
		implementation = 'prefer_rust_with_warning',
	},
	keymap = {
		preset = 'enter',
		["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
		["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		["<CR>"] = { "select_and_accept", "fallback" },
	}
}

-- treesitter
require "nvim-treesitter.configs".setup {
	auto_install = true,
	sync_install = false,
	ignore_install = {},
	ensure_installed = {},
	modules = {},
	highlight = {
		enable = true,
	},
}
