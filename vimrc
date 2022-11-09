syntax on
filetype plugin on

" {{{ Options
set nocompatible
set encoding=utf-8
set noswapfile
set nobackup
set nowritebackup
set history=1000
set undolevels=1000
set updatetime=300
set laststatus=2
set colorcolumn=80
set relativenumber
set splitright
set splitbelow
set shiftround
set autoread
set cmdheight=1
set shortmess+=c
set path+=**
set nowrap
set backspace=indent,eol,start
set number
set ruler
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set cursorline
set background=dark
set termguicolors
set foldmethod=marker
set showmatch
set hlsearch
set incsearch
set wildmenu
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set spelllang=en_gb
set spellfile=local.utf-8.add

let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_list_hide='.*\.git/$'
let g:netrw_winsize=30

let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead'
  \ },
  \ }
" }}}

" {{{ Plugins
call plug#begin()
  " Colorscheme
  Plug 'nanotech/jellybeans.vim'

  " Useful stuff
  Plug 'airblade/vim-gitgutter'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'itchyny/lightline.vim'
call plug#end()
" }}}

colorscheme jellybeans
let mapleader = ' '

" RETURN turns off search highlighting
nnoremap <cr> :noh<CR><CR>:<backspace>

" Ghetto NERDTree
nnoremap <leader>f :Lexplore <CR>

" Buffers
noremap <leader>q :bdelete <CR>
noremap <leader>w :bn <CR>

" Delete whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Oooops
command! W noautocmd w

" File associations
autocmd BufRead,BufNewFile *.v set filetype=verilog
autocmd BufRead,BufNewFile *.sv set filetype=systemverilog
autocmd BufRead,BufNewFile *.yml set filetype=yamla

" LSP
nnoremap <Leader>d :LspDocumentDiagnostics<CR>

if executable('svls')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'svls',
      \ 'cmd': {server_info->['svls']},
      \ 'whitelist': ['systemverilog'],
      \ })
  let g:lsp_diagnostics_virtual_text_enabled = 1
  let g:lsp_diagnostics_signs_enabled = 1
  let g:lsp_log_file = expand('~/.vim-lsp.log')
  nmap <buffer> [d <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]d <plug>(lsp-next-diagnostic)
endif
