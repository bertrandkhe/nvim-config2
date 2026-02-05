vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = { "javascript", "typescript", "astro", "html", "css", "lua", "vim", "vimdoc" },
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	-- Automatically install missing parsers when entering buffer
	auto_install = true,
	highlight = {
		enable = true, -- Highly recommended to enable this
	},
})

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "ts", "js", "astro" },
-- 	callback = function()
-- 		vim.treesitter.start()
-- 	end,
-- })
