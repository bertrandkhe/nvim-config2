vim.opt.nu = true
vim.opt.rnu = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.cindent = true
vim.opt.smartindent = true

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

local use = require("packer").use
require("packer").startup(
    function()
        use "folke/tokyonight.nvim"

        use "wbthomason/packer.nvim" -- Package manager
        use "neovim/nvim-lspconfig" -- Configurations for Nvim LSP
        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-cmdline"
        use "hrsh7th/nvim-cmp"

        use "hrsh7th/cmp-vsnip"
        use "hrsh7th/vim-vsnip"

        use "lbrayner/vim-rzip"
        use {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.1",
            requires = {{"nvim-lua/plenary.nvim"}}
        }
        use "nvim-tree/nvim-web-devicons"

        use {
            "nvim-telescope/telescope-file-browser.nvim",
            requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}
        }
        use "vim-airline/vim-airline"
        use "vim-airline/vim-airline-themes"
        use {
            "nvim-treesitter/nvim-treesitter",
            run = function()
                local ts_update = require("nvim-treesitter.install").update({with_sync = true})
                ts_update()
            end
        }
        use "nvim-treesitter/playground"
        use "b0o/schemastore.nvim"
        use(
            {
                "aserowy/tmux.nvim",
                config = function()
                    return require("tmux").setup()
                end
            }
        )
        use "sbdchd/neoformat"
    end
)
-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
    require("packer").sync()
else
    require("mylspconfig")
    require("telescopeconfig")
    require("treesitterconfig")
    require("cmpconfig")
    vim.cmd [[colorscheme tokyonight]]
    vim.g.neoformat_enabled_js = {"prettier"}
    vim.g.neoformat_enabled_css = {"prettier"}
    vim.g.neoformat_enabled_html = {"prettier"}
    vim.api.nvim_set_keymap("n", "ff", ":Neoformat<CR>", {noremap = true, silent = true})
end
