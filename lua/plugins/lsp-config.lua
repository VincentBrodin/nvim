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
					"vue_ls",
					"svelte",
					"graphql",
					"emmet_ls",
					"pylsp",
					"jsonls"
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local function get_typescript_server_path()
				local npm_root = vim.fn.trim(vim.fn.system('npm root -g'))
				return npm_root .. '/typescript/lib'
			end

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
				settings = {
					gopls = {
						buildFlags = { "-tags=integration" },
						usePlaceholders = true,
						completeUnimported = true,
						staticcheck = true,
						gofumpt = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			})
			-- Svelte
			lspconfig.svelte.setup({
				capabilities = capabilities,
			})
			--Vue, Js & Ts
			local fn = vim.fn
			local mason_data = fn.stdpath("data") .. "/mason"
			local vue_language_server = mason_data .. "/packages/vue-language-server/node_modules/@vue/language-server"
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				path = get_typescript_server_path(),
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
					configurationSection = { "html", "hbs", "handlebars", "css", "razor", "cshtml", "javascript", "vue" },
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
				filetypes = { "css", "scss", "less" },
				init_options = {
					provideFormatter = true,
				},
			})
			-- Emmet
			lspconfig.emmet_ls.setup({
				-- on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue", "razor", "cshtml" },
				init_options = {
					html = {
						options = {
							-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
							["bem.enabled"] = true,
						},
					},
				}
			}) --Tailwind
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
						cargo = { allFeatures = true },
						checkOnSave = { command = "clippy" },
						completion = {
							autoimport = { enable = true },
							postfix = { enable = true },
						},
					},
				},
			})
			-- GraphQl
			lspconfig.graphql.setup({
				capabilities = capabilities,
				filetypes = { "graphql", "graphqls", "typescriptreact", "javascriptreact" },
			})
			-- Python
			lspconfig.pylsp.setup({
				capabilities = capabilities,
			})
			-- Json
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			-- C#
			-- local pid = tostring(vim.fn.getpid())
			-- lspconfig.omnisharp.setup({
			-- 	capabilities = capabilities,
			-- 	cmd = {
			-- 		"OmniSharp",
			-- 		"-z",
			-- 		"--hostPID", pid,
			-- 		"--encoding", "utf-8"
			-- 	}
			-- })
			--
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
