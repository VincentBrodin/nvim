return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"zls",
					"rust_analyzer",
					"gopls",
					"ts_ls",
					"html",
					"cssls",
					"tailwindcss",
					"clangd",
					"volar",
					"svelte",
					"graphql",
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
			--
			lspconfig.svelte.setup({
				capabilities = capabilities,
			})
			--Vue, Js & Ts
			local mason_registry = require("mason-registry")
			local vue_language_server = mason_registry.get_package("vue-language-server"):get_install_path()
				.. "/node_modules/@vue/language-server"

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_language_server,
							languages = { "vue" },
						},
					},
				},
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			})
			--Html
			lspconfig.html.setup({
				capabilities = capabilities,
				filetypes = { "html", "templ", "hbs", "handlebars", "razor", "cshtml", "vue" },
				init_options = {
					configurationSection = { "html", "hbs", "handlebars", "css", "javascript", "vue" },
					embeddedLanguages = {
						css = true,
						javascript = true,
					},
					provideFormatter = true,
				},
			})
			--Css
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			--Tailwind
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
			-- GraphQl
			lspconfig.graphql.setup({
				capabilities = capabilities,
				filetypes = { "graphql", "graphqls", "typescriptreact", "javascriptreact" },
			})
			-- C#
			lspconfig.roslyn.setup({
				capabilities = capabilities
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
					vim.keymap.set({ "n", "v" }, "<C-e><C-d>", function()
						buf.format({ async = true })
					end, opts)
				end,
			})
		end,
	},
}
