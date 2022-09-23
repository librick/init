require "user.options"
require "user.plugins"

vim.cmd [[colorscheme embark]]
--vim.cmd [[colorscheme nightfly]]
--vim.cmd [[colorscheme tokyonight]]
vim.g.transparent_enabled = true
vim.g.tokyonight_transparent = vim.g.transparent_enabled
vim.g.nightflyTransparent = vim.g.transparent_enabled
vim.g.netrw_dirhistmax = 0
vim.cmd "highlight LineNr guifg=white guibg=black"
vim.cmd "set list listchars=tab:>\\ ,space:·,trail:-,eol:$"

vim.cmd ":set colorcolumn=80"

-- Go indentation rules
vim.cmd "au FileType go set noexpandtab"
vim.cmd "au FileType go set shiftwidth=4"
vim.cmd "au FileType go set softtabstop=4"
vim.cmd "au FileType go set tabstop=4"
-- Go highlighting rules
vim.cmd "let g:go_highlight_build_constraints = 1"
vim.cmd "let g:go_highlight_extra_types = 1"
vim.cmd "let g:go_highlight_fields = 1"
vim.cmd "let g:go_highlight_functions = 1"
vim.cmd "let g:go_highlight_methods = 1"
vim.cmd "let g:go_highlight_operators = 1"
vim.cmd "let g:go_highlight_structs = 1"
vim.cmd "let g:go_highlight_types = 1"
vim.cmd "let g:go_auto_sameids = 1"
-- Go auto-import dependencies (feature of gofmt)
vim.cmd "let g:go_fmt_command = \"goimports\""

