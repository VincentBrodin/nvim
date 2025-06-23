vim.g.mapleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.clipboard = "unnamedplus"
-- This hides those ~ from a line thats missing
opt.fillchars = { eob = " " }
opt.wrap = false

--Navigate splits
vim.cmd("nmap <silent> <c-k> :wincmd k<CR>")
vim.cmd("nmap <silent> <c-j> :wincmd j<CR>")
vim.cmd("nmap <silent> <c-h> :wincmd h<CR>")
vim.cmd("nmap <silent> <c-l> :wincmd l<CR>")

-- Stops code from moving right when an error is shown
vim.o.signcolumn = "yes"

-- Makes it so that :W will save and not give that anoying error
local api = vim.api
api.nvim_create_user_command("W", "w", {})
api.nvim_create_user_command("Q", "q", {})

vim.keymap.set("n", "<Leader>h", "<CMD>noh<CR>", {})
vim.keymap.set("n", "<Leader>rl", "<CMD>LspRestart<CR>", {})
vim.keymap.set("n", "<C-y>", "<CMD>redo<CR>", {})

vim.cmd("set termguicolors")


vim.cmd("set bg=dark")

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false
})
