vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
use 'wbthomason/packer.nvim'

-- easy file navigation
use {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	requires = {'nvim-lua/plenary.nvim', 'onsails/lspkind.nvim', 'nvim-tree/nvim-web-devicons'}
}

-- themes
use { "tpaau-17DB/habamax.nvim", requires={ "rktjmp/lush.nvim" } }
vim.cmd('colorscheme habamax')

-- colorize hexcodes
use 'norcalli/nvim-colorizer.lua'

-- colorcolumn
use "ecthelionvi/NeoColumn.nvim"

-- treesitter
use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

-- Configuring LSP servers
use("neovim/nvim-lspconfig")

-- rust tools
use 'simrat39/rust-tools.nvim'
use 'mrcjkb/rustaceanvim'

-- mason
use 'williamboman/mason.nvim'
use 'williamboman/mason-lspconfig.nvim'

-- autocompletion
use 'neoclide/coc.nvim'

use 'windwp/nvim-autopairs'

-- status bar
use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
}

end)
