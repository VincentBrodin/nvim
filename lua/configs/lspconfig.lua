-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
-- local servers = { "html", "cssls", "pylsp", "clangd", "ts_ls", "csharp_ls", "denols", "gopls", "jinja_lsp" }
local servers = { "html", "cssls", "pylsp", "clangd", "ts_ls", "omnisharp", "denols", "gopls" }
-- local servers = { "html", "cssls", "pylsp", "ast_grep", "ts_ls", "csharp_ls", "denols" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	}
end

lspconfig.omnisharp.setup {
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
	cmd = { vim.fn.stdpath "data" .. "/mason/bin/omnisharp" },
	enable_ms_build_load_projects_on_demand = false,
	enable_editorconfig_support = true,
	enable_roslyn_analysers = true,
	enable_import_completion = true,
	organize_imports_on_format = true,
	enable_decompilation_support = true,
	analyze_open_documents_only = false,
	filetypes = { "cs", "vb", "csproj", "sln", "slnx", "props", "csx", "targets" },
}

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
