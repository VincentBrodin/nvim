vim.g.mapleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.clipboard = "unnamedplus"
-- This hides those ~ from a line thats missing
opt.fillchars = { eob = " " }

--Navigate splits
vim.cmd("nmap <silent> <c-k> :wincmd k<CR>")
vim.cmd("nmap <silent> <c-j> :wincmd j<CR>")
vim.cmd("nmap <silent> <c-h> :wincmd h<CR>")
vim.cmd("nmap <silent> <c-l> :wincmd l<CR>")

-- Stops code from moving right when an error is shown
vim.o.signcolumn = "yes"

-- Makes it so that :W will save and not give that anoying error
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Q', 'q', {})
