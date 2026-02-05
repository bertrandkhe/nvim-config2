vim.pack.add({
	"https://github.com/sbdchd/neoformat",
})

vim.g.neoformat_enabled_typescript = { "prettier" }
vim.g.neoformat_enabled_javascript = { "prettier" }
vim.g.neoformat_enabled_astro = { "prettier" }
vim.g.neoformat_enabled_css = { "prettier" }
vim.g.neoformat_enabled_html = { "prettier" }
vim.g.neoformat_enabled_lua = { "stylua" }
vim.api.nvim_set_keymap("n", "ff", ":Neoformat<CR>", { noremap = true, silent = false })
