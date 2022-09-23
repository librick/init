local options = {
	backup = false,			-- creates a backup file
	clipboard = "unnamedplus",	-- allows neovim to access the system clipboard
	cmdheight = 8,			-- more space in the neovim command line for displaying messages
	conceallevel = 0,
	fileencoding = "utf-8",		-- the encoding written to a file
	hlsearch = true,			-- highlight search
	ignorecase = true,		-- ignore case in search patterns
	mouse = "a",			-- allows the mouse to be used in neovim
	pumheight = 10,			-- popup menu height
	showmode = false,
	showtabline = 2,			-- always show tabs
	smartcase = true,
	smartindent = true,
	splitbelow = true,		-- force all horizontal splits to go below current window
	splitright = true,		-- force all vertical splits to go to the right of current window
	swapfile = false,		-- creates a swap file
	timeoutlen = 1000,		-- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true	,		-- enable persistent undo
	updatetime = 300,		-- faster completion (400ms default)
	compatible = false,		-- enable compatibility to old-time vi
	writebackup = false,
	showmatch = true,   	-- show matching
	incsearch = true,   	-- incremental search
	tabstop = 4,
	softtabstop = 4,
	expandtab = true,
	shiftwidth = 4,
	autoindent = true,		-- indent new line the same amount as previous
	number = true,  		-- set numbered lines
	relativenumber = false, -- set relative numbered lines
	numberwidth = 4,
    --signcolumn = true,	-- always show the sign column, otherwise it would shift the text each time
	wrap = false,			-- display lines as one long line
	scrolloff = 8,
	sidescrolloff = 9,
    --	syntax = true,  	-- syntax highlighting
	cursorline = true,		-- highlight current cursorline
	ttyfast = true, 		-- speed up scrolling
    termguicolors = true
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

