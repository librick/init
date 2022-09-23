
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
-- Themes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/everforest'
Plug('embark-theme/vim', { as = 'embark', branch = 'main' })
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'joshdick/onedark.vim'
Plug('folke/tokyonight.nvim', { branch = 'main' })
-- Non-theme plugins
Plug 'fatih/vim-go'
Plug 'feline-nvim/feline.nvim'
Plug 'xiyaowong/nvim-transparent'
vim.call('plug#end')
require('feline').setup()

