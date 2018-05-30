set nocompatible

filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Townk/vim-autoclose'
Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-clang'
"Plugin 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plugin 'scrooloose/nerdtree'
Plugin 'arakashic/chromatica.nvim'

Plugin 'dracula/vim'

call vundle#end()

filetype plugin indent on

let g:airline_theme='dracula'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" DEOPLETE
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang'
let g:python3_host_prog = '/usr/local/bin/python3'

set completeopt -=preview

let g:chromatica#libclang_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:chromatica#responsive_mode=1
let g:chromatica#enable_at_startup=1

" NERDTree
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" autoload NERDTree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

syntax enable 
set nowrap
set encoding=utf8

set backspace=indent,eol,start

set number
set ruler

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

set laststatus=2

set cursorline

"set background=dark
set termguicolors
colorscheme dracula 

