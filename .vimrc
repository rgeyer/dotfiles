" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set number
set backspace=indent,eol,start
set showmode
set autoread

syntax on

set incsearch "Find the next match as we type the search
set hlsearch "Highlight searches by default

" I don't need no stinking backups
set noswapfile
set nobackup
set nowb

" Indentation yo
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on "What is this? (RJG)
filetype indent on "What is this? (RJG)

