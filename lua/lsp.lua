vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.diagnostic.config({
	virtual_text = { current_line = true },
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Show line diagnostics automatically in hover window
-- vim.o.updatetime = 250
-- vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("astro", {
	capabilities = capabilities,
})
vim.lsp.enable("astro")
vim.lsp.config("ts_ls", {
	capabilities = capabilities,
})
vim.lsp.enable("ts_ls")
vim.lsp.config("yamlls", {
	capabilities = capabilities,
	settings = {
		yaml = {
			schemas = require("schemastore").yaml.schemas(),
		},
	},
})
vim.lsp.enable("yamlls")
vim.lsp.config("jsonls", {
	capabilities = capabilities,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})
vim.lsp.enable("jsonls")
vim.lsp.config("tailwindcss", {
	capabilities = capabilities,
})
vim.lsp.enable("tailwindcss")
vim.lsp.config("gopls", {
	capabilities = capabilities,
})
vim.lsp.enable("gopls")
