set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

:set ruler
:set number
:set colorcolumn=81

:set expandtab
:set shiftwidth=2
:set softtabstop=4

":set foldmethod=indent
":set foldnestmax=10
":set foldlevelstart=1
":hi Folded ctermbg=233 ctermfg=241

:set backspace=indent,eol,start

:set clipboard=unnamed

match ErrorMsg '\s\+$'

if &diff
  colorscheme jellybeans
endif
