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
set hidden
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
set completeopt=longest,menuone
set signcolumn=yes
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_list_hide='.*\.git/$'
let g:netrw_winsize=30
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" }}}

" {{{ Plugins
call plug#begin()
  " Colorscheme
  Plug 'nanotech/jellybeans.vim'
  " Useful stuff
  Plug 'airblade/vim-gitgutter'
  "Plug 'prabirshrestha/vim-lsp'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'itchyny/lightline.vim'
  Plug 'SirVer/ultisnips'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jiangmiao/auto-pairs'
call plug#end()
" }}}

colorscheme jellybeans
let mapleader = ' '

" Remove search HL on return
nnoremap <CR> :noh<CR><CR>

" Ghetto NERDTree
nnoremap <leader>f :Lexplore <CR>

" Buffers
noremap <leader>q :bdelete <CR>
noremap <leader><tab> :bn <CR>

" Delete whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Oooops
command! W noautocmd w

" File associations
autocmd BufRead,BufNewFile *.v set filetype=verilog
autocmd BufRead,BufNewFile *.sv set filetype=systemverilog
autocmd BufRead,BufNewFile *.yml set filetype=yaml

" Allow tab in makefiles
autocmd FileType make setlocal noexpandtab

autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType rust setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType c setlocal tabstop=8 softtabstop=8 shiftwidth=8
autocmd FileType cpp setlocal tabstop=8 softtabstop=8 shiftwidth=8


" COC
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <leader>rn <Plug>(coc-rename)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <leader>d :CocDiagnostics <CR>

