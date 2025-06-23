return {
	"nvimdev/indentmini.nvim",
	config = function()
		vim.cmd.highlight('IndentLine guifg=#EA83A5')
		vim.cmd.highlight('IndentLineCurrent guifg=#90B99F')
		require("indentmini").setup()
	end
}
