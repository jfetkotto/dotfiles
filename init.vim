"set nocompatible

filetype off

" ********************************************
" HARDMODE
" ********************************************
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

noremap <PageDown> <NOP>
noremap <PageUp> <NOP>
inoremap <PageDown> <NOP>
inoremap <PageUp> <NOP>

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'

Plugin 'jiangmiao/auto-pairs'
Plugin 'frazrepo/vim-rainbow'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'nanotech/jellybeans.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'vhda/verilog_systemverilog.vim'

Plugin 'preservim/nerdcommenter'

"Colorschemes

call vundle#end()

set hidden

set noswapfile

set laststatus=2
set colorcolumn=80
set relativenumber
set splitright
set splitbelow
set shiftround
set autoread

let mapleader = '`'

"inoremap {<Enter> {<Enter>}<Esc>O

let g:airline_theme= 'jellybeans'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_powerline_fonts = 1

" RAINBOW
let g:rainbow_active = 1

set completeopt -=preview

" NERDTree
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" autoload NERDTree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Return exits Popup
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
"let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

syntax enable
set nowrap
set encoding=utf8

set backspace=indent,eol,start

set number
set ruler

set tabstop=2
set shiftwidth=2
set smarttab
set expandtab

set laststatus=2

set cursorline

set background=dark
set termguicolors
colorscheme jellybeans


"Nice buffers
map <leader>w :bn<CR>
map <leader>q :bdelete<CR>

" RETURN turns off search highlighting
nnoremap <cr> :noh<CR><CR>:<backspace>


" C
autocmd FileType c setlocal ts=4 sw=4 expandtab

" Delete whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Stop associating .v with vlang
"autocmd BufNewFile,BufRead *.v set syntax=verilog
autocmd BufRead,BufNewFile *.v set filetype=verilog
autocmd BufRead,BufNewFile *.sv set filetype=systemverilog
