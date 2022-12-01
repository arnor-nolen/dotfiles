set nocompatible " Disable compatibility to old-time vi
set tabstop=4 " Width of tab character 
set expandtab " Convert tabs to white spaces
set shiftwidth=4 " Size of an indent
set number relativenumber " Add line numbers
filetype plugin indent on " Allow auto-indenting based on file type
syntax on " Syntax highlighting
set ttyfast " Faster scrolling
set noswapfile " Disable creating swap files
set backupdir=~/.cache/vim " Directory to store backup files
set nohlsearch
nmap <C-p> :GFiles<CR>

" Plugins
call plug#begin()
 Plug 'morhetz/gruvbox'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme gruvbox

" Transparent background
hi Normal guibg=NONE ctermbg=NONE 

" CoC config
let g:coc_global_extensions = [
 \ 'coc-tsserver',
 \ 'coc-eslint',
 \ 'coc-prettier',
 \ 'coc-json',
 \ ]

" If hidden is not set, TextEdit might fail
set hidden
