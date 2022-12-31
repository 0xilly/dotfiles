"set showtabline=0
set showtabline=1
set modeline

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

let @t = 'i//Todo(anita): '
let @n = 'i//Note(anita): '
let @f = 'i//Fixme(anita): '

