" Configuration VIM par défaut
" Coloration syntaxique
" Aucun plugin

let mapleader = ' '
let g:mapleader = ' '

set number
set relativenumber
set shiftwidth=4
set tabstop=4
set expandtab
set scrolloff=15
set hlsearch
set ignorecase
syntax on
set nocompatible
set title
set noerrorbells
set novisualbell
set visualbell t_vb=
set t_vb=
set wrap
set linebreak

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ %l:%c

" Show the status on the second to last line.
set laststatus=2

" }}}
