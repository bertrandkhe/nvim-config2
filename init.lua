vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.nu = true
vim.opt.rnu = true

local hooks = function(ev)
	-- Use available |event-data|
	local name, kind = ev.data.spec.name, ev.data.kind
	-- Run build script after plugin's code has changed
	if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
		-- Append `:wait()` if you need synchronous execution
		vim.system({ "make" }, { cwd = ev.data.path })
	end
end
-- If hooks need to run on install, run this before `vim.pack.add()`
-- To act on install from lockfile, run before very first `vim.pack.add()`
vim.api.nvim_create_autocmd("PackChanged", { callback = hooks })

require("theme")
require("tmuxconfig")
require("explorer")
require("telescope")
require("format")
require("cmpconfig")
require("lsp")
require("ts")
