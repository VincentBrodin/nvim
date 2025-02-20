return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"omnisharp",
					"zls",
					"rust_analyzer",
					"gopls",
					"ts_ls",
					"html",
					"tailwindcss",
					"clangd",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			--Lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			--Zig
			lspconfig.zls.setup({
				capabilities = capabilities,
			})
			--GO
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			--JavaScript/TypeScript
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			--Html
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			--CSS & Tailwind
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})
			--C
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			--Rust
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
						diagnostics = {
							enable = true,
						},
						flags = {
							debounce_text_changes = 150,
						},
					},
				},
			})
			--C#
			lspconfig.omnisharp.setup({
				capabilities = capabilities,
				cmd = {
					"dotnet",
					"C:/Users/vince/AppData/Local/nvim-data/mason/packages/omnisharp/libexec/OmniSharp.dll",
				},
				settings = {
					FormattingOptions = {
						EnableEditorConfigSupport = false,
						OrganizeImports = true,
					},
					MsBuild = {
						LoadProjectsOnDemand = nil,
					},
					RoslynExtensionsOptions = {
						EnableAnalyzersSupport = nil,
						EnableImportCompletion = nil,
						AnalyzeOpenDocumentsOnly = nil,
					},
					Sdk = {
						IncludePrereleases = true,
					},
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local opts = { buffer = ev.buf }
					local buf = vim.lsp.buf

					vim.keymap.set("n", "K", buf.hover, opts)
					vim.keymap.set("n", "gD", buf.declaration, opts)
					vim.keymap.set("n", "gd", buf.definition, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", buf.code_action, opts)
					vim.keymap.set({ "n", "v" }, "<C-e><C-d>", function()
						buf.format({ async = true })
					end, opts)
				end,
			})
		end,
	},
}
