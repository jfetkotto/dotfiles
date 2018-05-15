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
Plugin 'dracula/vim'

call vundle#end()

filetype plugin indent on

let g:airline_theme='dracula'
let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang'


syntax on
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

colorscheme dracula 

