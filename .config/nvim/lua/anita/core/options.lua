local opt = vim.opt

--line numbers
opt.relativenumber = true 
opt.number = true 

-- tabs & indentation
opt.tabstop = 2 
-- opt.shiftwidth = 2 
-- opt.expandtab = false
opt.autoindent = true

vim.g.editorconfig = true

-- line wrapping
opt.wrap = false 

-- search settings
opt.ignorecase = true 
opt.smartcase = true 

-- cursor line
opt.cursorline = true 

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
