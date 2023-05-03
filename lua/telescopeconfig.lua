local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, {})

vim.api.nvim_set_keymap(
    "n",
    "<space>fb",
    "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
    {noremap = true}
)

require "telescope".setup {
    extensions = {
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = {"png", "webp", "jpg", "jpeg"},
            -- find command (defaults to `fd`)
            find_cmd = "rg"
        },
        file_browser = {
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true
        }
    }
}
require("telescope").load_extension "file_browser"
require("telescope").load_extension("media_files")
